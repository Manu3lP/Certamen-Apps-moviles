import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class Equipos extends StatefulWidget {
  final int id;
  final String nombre;
  final String perfil;
  Equipos(
      {this.id = 0, this.nombre = 'Sin nombre', this.perfil = 'Sin perfil'});

  @override
  State<Equipos> createState() => _EquiposState();
}

class _EquiposState extends State<Equipos> {
  @override
  Widget build(BuildContext context) {
    int idTeam = this.widget.id;
    String nombreTeam = this.widget.nombre;
    String perfilTeam = this.widget.perfil;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  //insertar datos de la base api
                  // Image.asset(
                  //   'lib/img/wololo.jpg',
                  //   scale: 1,
                  // ),
                  // SizedBox(
                  //   height: 10,
                  //),
                  Text(
                    'Nombre del equipo: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$nombreTeam',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'id del equipo: ' '$idTeam',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'juego: ' '$perfilTeam',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                    onPressed: () async {
                      print('BORRAR: ${this.widget.id}');
                      await HttpService()
                          .borrarEquipo(this.widget.id)
                          .then((borradoOK) {
                        if (borradoOK) {
                          print('Equipo borrado :)');
                          setState(() {});
                        }
                      });
                    },
                    child: Text('Borrar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
