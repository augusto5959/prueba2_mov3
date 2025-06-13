import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba2_mov3/auth/LoginScreen.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro"),),
      body: formularioRegistro(context),
    );
  }
}

Widget formularioRegistro(context) {
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
          onPressed: () => registrarse(_correo.text, _contrasenia.text, context),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50), // Full width button
          ),
          child: Text("Registrarse"),
        ),
      ],
    ),
  );
}

Future<void> registrarse(String correo, String contrasenia, context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: correo,
      password: contrasenia,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Registro exitoso")),
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error al registrarse: $e")),
    );
  }
}