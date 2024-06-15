import 'package:certamen_2/Services/http_service.dart';
import 'package:certamen_2/componentes/partidos.dart';
import 'package:certamen_2/pages/Partidos_agregar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Rounds extends StatefulWidget {
  const Rounds({super.key});

  @override
  State<Rounds> createState() => _RoundsState();
}

class _RoundsState extends State<Rounds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: HttpService().partidos(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var partido = snapshot.data[index];
                      return Partidos(
                        //editar datos del equipo
                        id: partido['id'],
                        campeonato: partido['campeonato'],
                        equipo_a: partido['equipo_a'],
                        equipo_b: partido['equipo_b'],
                        fecha_hora: partido['fecha_hora'],
                        lugar: partido['lugar'],
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
            builder: (context) => PartidosAgregar(),
          );
          Navigator.push(context, ruta).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
