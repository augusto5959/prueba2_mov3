import 'package:flutter/material.dart';

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
              onPressed: ()=>(),
              child: const Text('LOGIN'),
            ),
            ElevatedButton(
              onPressed: ()=>(),
              child: const Text('REGISTRARSE'),
            ),
          ],
        ),
      ),
    );
  }
}