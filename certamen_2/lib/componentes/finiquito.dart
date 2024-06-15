import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class Resultados extends StatefulWidget {
  final int id;
  final String partido_id;
  final int equipo_ganador;
  final int equipo_perdedor;
  final int puntos_ganador;
  final int puntos_perdedor;
  Resultados({
    this.id = 0,
    this.partido_id = 'sin id',
    this.equipo_ganador = 0,
    this.equipo_perdedor = 0,
    this.puntos_ganador = 0,
    this.puntos_perdedor = 0,
  });

  @override
  State<Resultados> createState() => _ResultadosState();
}

class _ResultadosState extends State<Resultados> {
  @override
  Widget build(BuildContext context) {
    //int id = this.widget.id;
    String idPart = this.widget.partido_id;
    int equipoWin = this.widget.equipo_ganador;
    int equipoLose = this.widget.equipo_perdedor;
    int puntosWin = this.widget.puntos_ganador;
    int puntosLose = this.widget.puntos_perdedor;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //insertar datos de la base api
                // Image.asset(
                //   'lib/img/wololo.jpg',
                //   scale: 1,
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Partido $idPart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Ganador: equipo $equipoWin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Perdedor: Equipo $equipoLose',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Puntos ganador: ' + '$puntosWin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Puntos Perdedor: ' + '$puntosLose',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FilledButton(
                  onPressed: () async {
                    print('BORRAR: ${this.widget.id}');
                    await HttpService()
                        .borrarResultado(this.widget.id)
                        .then((borradoOK) {
                      if (borradoOK) {
                        print('Resultado borrado :)');
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
