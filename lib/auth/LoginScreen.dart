import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba2_mov3/screens/ComentariosScreen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: formularioLogin(context),
    );
  }
}

Widget formularioLogin(context){
  TextEditingController _correo = TextEditingController();
  TextEditingController _contrasenia = TextEditingController();

  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _correo,
          decoration: InputDecoration(
            labelText: "Correo",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _contrasenia,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Contraseña",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: ()=>registrarse(_correo.text, _contrasenia.text, context),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50), // Full width button
          ),
          child: Text("Iniciar Sesión"),
        ),
      ],
    ),
  );
}

Future<void> registrarse(String correo, String contrasenia, context) async {
  try{
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: correo,
      password: contrasenia,
    );

 Navigator.push(context, MaterialPageRoute(builder: (context) => Comentarios()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}