import 'package:certamen_2/Services/http_service.dart';
import 'package:certamen_2/componentes/players.dart';
import 'package:certamen_2/pages/Jugadores_agregar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Play extends StatefulWidget {
  Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: HttpService().jugadores(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var jugador = snapshot.data[index];
                      return Players(
                        //editar datos del equipo
                        id: jugador['id'],
                        nombre: jugador['nombre'],
                        apellido: jugador['apellido'],
                        pais: jugador['pais'],
                        juego: jugador['juego'],
                        equipo_id: jugador['equipo_id'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     MdiIcons.plus,
      //     color: Colors.white,
      //   ),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //   onPressed: () {
      //     MaterialPageRoute ruta = MaterialPageRoute(
      //       builder: (context) => JugadoresAgregar(),
      //     );
      //     Navigator.push(context, ruta).then((value) {
      //       setState(() {});
      //     });
      //   },
      // ),
    );
  }
}
