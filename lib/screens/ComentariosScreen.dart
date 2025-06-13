import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prueba2_mov3/screens/ListaScreen.dart';
import 'package:prueba2_mov3/screens/WelcomeScreen.dart';

class Comentarios extends StatelessWidget {
  const Comentarios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: formulario(context),
    drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Menú',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const  Welcome()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Peliculas'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Lista()));
              },
            ),

          ],
        ),
      ),);
  }
}

Widget formulario(context){
  TextEditingController serie = TextEditingController();
  TextEditingController comentario = TextEditingController();

  return SingleChildScrollView(
    child: Column(
      children: [
        
        TextField(
          controller: serie,
          decoration: const InputDecoration(labelText: "Serie"),
        ),
        TextField(
          controller: comentario,
          decoration: const InputDecoration(labelText: "Comentario"),
        ),
        FilledButton(onPressed: ()=>guardar(serie.text, comentario.text, context), child: Text("Enviar")),
      ],
    ),
  );
}

Future<void> guardar(String serie, String comentario, context) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("Comentarios").push();

  await ref.set({
    "serie": serie,
    "comentario": comentario,
  });
  Navigator.push(context, MaterialPageRoute(builder: (context) => Lista()));
}
