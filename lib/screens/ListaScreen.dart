import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba2_mov3/screens/ComentariosScreen.dart';
import 'package:prueba2_mov3/screens/WelcomeScreen.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Peliculas'),
        centerTitle: true,
      ),
      body: lista(),

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Peliculas'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Comentarios()));
              },
            ),

          ],
        ),
      ),
      
    );
  }
}

Future<List> leerAPI() async{
  final respuesta = await http.get(Uri.parse("https://jritsqmet.github.io/web-api/peliculas2.json"));

if (respuesta.statusCode == 200) {
    final data = json.decode(respuesta.body);
  return data['peliculas'];}
  else {
    throw Exception('Error al cargar los datos');
  }
}

Widget lista(){
  return FutureBuilder(future: leerAPI(), builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }else if (snapshot.hasData) {
      List peliculas = snapshot.data as List;
      return ListView.builder(
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(peliculas[index]['titulo']),
            subtitle: Text(peliculas[index]['descripcion']),
            leading: Image.network(peliculas[index]['enlaces']['image']),
          );
        },
      );
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }
    return const Center(child: CircularProgressIndicator());
  });
}