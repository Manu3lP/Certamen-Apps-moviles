import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class Micampeonato extends StatefulWidget {
  final int id;
  final String nombre;
  final String premios;
  final String fecha_inicio;
  final String fecha_fin;
  final String reglas;
  final String detalles;

  Micampeonato(
      {this.id = 0,
      this.nombre = 'Sin nombre',
      this.premios = 'Sin Premios',
      this.reglas = 'Sin reglas',
      this.fecha_inicio = 'Sin fecha',
      this.fecha_fin = 'Sin fecha',
      this.detalles = 'Sin detalles'});

  @override
  State<Micampeonato> createState() => _MicampeonatoState();
}

class _MicampeonatoState extends State<Micampeonato> {
  @override
  Widget build(BuildContext context) {
    //int idCamp = this.widget.id;
    String nombreCamp = this.widget.nombre;
    String premiosCamp = this.widget.premios;
    String reglasCamp = this.widget.reglas;
    //String detallesCamp = this.widget.detalles;
    String fechaIncCamp = this.widget.fecha_inicio;
    String fechaTermCamp = this.widget.fecha_fin;
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
                Image.asset(
                  'lib/img/wololo.jpg',
                  scale: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$nombreCamp',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Premios:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '$premiosCamp',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Reglas: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '$reglasCamp',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Inicio: ' + '$fechaIncCamp',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Termino: ' + '$fechaTermCamp',
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
                        .borrarCampeonato(this.widget.id)
                        .then((borradoOK) {
                      if (borradoOK) {
                        print('Campeonato borrado :)');
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
