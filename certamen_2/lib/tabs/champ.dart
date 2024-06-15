import 'package:certamen_2/Services/http_service.dart';
import 'package:certamen_2/componentes/liga.dart';
import 'package:certamen_2/pages/Campeonatos_agregar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Champ extends StatefulWidget {
  Champ({super.key});

  @override
  State<Champ> createState() => _ChampState();
}

class _ChampState extends State<Champ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: HttpService().campeonatos(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var campeonato = snapshot.data[index];
                      return Micampeonato(
                        id: campeonato['id'],
                        nombre: campeonato['nombre'],
                        premios: campeonato['premios'],
                        detalles: campeonato['detalles'],
                        reglas: campeonato['reglas'],
                        fecha_inicio: campeonato['fecha_inicio'],
                        fecha_fin: campeonato['fecha_fin'],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          MdiIcons.plus,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          MaterialPageRoute ruta = MaterialPageRoute(
            builder: (context) => CampeonatosAgregar(),
          );
          Navigator.push(context, ruta).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
