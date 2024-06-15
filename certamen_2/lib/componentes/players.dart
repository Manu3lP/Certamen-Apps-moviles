import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class Players extends StatefulWidget {
  final int id;
  final String nombre;
  final String apellido;
  final String pais;
  final String juego;
  final int equipo_id;

  Players(
      {this.id = 0,
      this.nombre = 'Sin nombre',
      this.apellido = 'Sin Premios',
      this.pais = 'Sin reglas',
      this.juego = 'Sin fecha',
      this.equipo_id = 0});

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  Widget build(BuildContext context) {
    //int idCamp = this.widget.id;
    String nombrePlay = this.widget.nombre;
    String apellidoPlay = this.widget.apellido;
    String paisPlay = this.widget.pais;
    //String detallesCamp = this.widget.detalles;
    String juegoPlay = this.widget.juego;
    int equipoIdPlay = this.widget.equipo_id;
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
                //Text(
                //'id: ' + '$idCamp',
                //  style: TextStyle(
                //  color: Colors.white,
                //  fontSize: 20,
                //),
                //),

                SizedBox(
                  height: 10,
                ),
                Text(
                  '$nombrePlay' ' ' '$apellidoPlay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Pais: ' + '$paisPlay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Juego: ' + '$juegoPlay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Equipo: ' + '$equipoIdPlay',
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
                        .borrarJugador(this.widget.id)
                        .then((borradoOK) {
                      if (borradoOK) {
                        print('Jugador borrado :)');
                        setState(() {});
                      }
                    });
                  },
                  child: Text('Borrar'),
                ),

                // Miboton(
                //   text: 'ver detalles',
                //   onTap: () {
                //     Navigator.pushNamed(context, '/datosliga');
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
