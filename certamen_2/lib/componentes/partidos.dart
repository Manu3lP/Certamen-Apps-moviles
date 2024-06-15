import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class Partidos extends StatefulWidget {
  final int id;
  final String campeonato;
  final String equipo_a;
  final String equipo_b;
  final String fecha_hora;
  final String lugar;
  Partidos(
      {this.id = 0,
      this.campeonato = 'Sin id',
      this.equipo_a = 'sin id',
      this.equipo_b = 'sin id',
      this.fecha_hora = 'sin fecha ni hora',
      this.lugar = "Sin lugar"});

  @override
  State<Partidos> createState() => _PartidosState();
}

class _PartidosState extends State<Partidos> {
  @override
  Widget build(BuildContext context) {
    //int idPart = this.widget.id;
    String campPart = this.widget.campeonato;
    String equipoAid = this.widget.equipo_a;
    String equipoBid = this.widget.equipo_b;
    String fechaHoraPart = this.widget.fecha_hora;
    String lugarPart = this.widget.lugar;

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
            Column(
              children: [
                //insertar datos de la base api

                SizedBox(
                  height: 10,
                ),
                Text(
                  '$campPart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Equipos: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$equipoAid' ' v/s ' '$equipoBid',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Inicio:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('$fechaHoraPart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lugar: ' + '$lugarPart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FilledButton(
                  onPressed: () async {
                    print('BORRAR: ${this.widget.id}');
                    await HttpService()
                        .borrarPartido(this.widget.id)
                        .then((borradoOK) {
                      if (borradoOK) {
                        print('Partido borrado :)');
                        setState(() {});
                      }
                    });
                  },
                  child: Text('Borrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
