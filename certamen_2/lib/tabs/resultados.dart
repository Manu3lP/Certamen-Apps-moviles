import 'package:certamen_2/Services/http_service.dart';
import 'package:certamen_2/componentes/finiquito.dart';
import 'package:certamen_2/pages/Resultados_agregar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: HttpService().resultados(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var resultado = snapshot.data[index];
                      return Resultados(
                        //editar datos del equipo
                        id: resultado['id'],
                        partido_id: resultado['partido_id'],
                        equipo_ganador: resultado['equipo_ganador'],
                        equipo_perdedor: resultado['equipo_perdedor'],
                        puntos_ganador: resultado['puntos_ganador'],
                        puntos_perdedor: resultado['puntos_perdedor'],
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
            builder: (context) => ResultadosAgregar(),
          );
          Navigator.push(context, ruta).then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
