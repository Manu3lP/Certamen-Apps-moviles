import 'package:certamen_2/Services/http_service.dart';
import 'package:certamen_2/componentes/equipos.dart';
import 'package:certamen_2/pages/Equipos_agregar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Tim extends StatefulWidget {
  Tim({super.key});

  @override
  State<Tim> createState() => _TimState();
}

class _TimState extends State<Tim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: HttpService().equipos(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var equipo = snapshot.data[index];
                      return Equipos(
                        //editar datos del equipo
                        id: equipo['id'],
                        nombre: equipo['nombre'],
                        perfil: equipo['perfil'],
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
            builder: (context) => EquiposAgregar(),
          );
          Navigator.push(context, ruta).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
