import 'package:flutter/material.dart';
import 'package:prueba2_mov3/auth/LoginScreen.dart';
import 'package:prueba2_mov3/auth/RegisterScreen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienbenido'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Desarrollado por: Augusto Viteri',              
              style: TextStyle(fontSize: 24),
            ),
            const Text("Usuario de GitHub: augusto5959",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const Login())),
              child: const Text('LOGIN'),
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const Register())),
              child: const Text('REGISTRARSE'),
            ),
          ],
        ),
      ),
    );
  }
}