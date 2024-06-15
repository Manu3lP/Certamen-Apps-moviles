import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class ResultadosAgregar extends StatefulWidget {
  const ResultadosAgregar({Key? key}) : super(key: key);

  @override
  State<ResultadosAgregar> createState() => _ResultadosAgregarState();
}

class _ResultadosAgregarState extends State<ResultadosAgregar> {
  TextEditingController idController = TextEditingController();
  TextEditingController partidoIdController = TextEditingController();
  TextEditingController ganadorIdController = TextEditingController();
  TextEditingController perdedorIdController = TextEditingController();
  TextEditingController puntosWinController = TextEditingController();
  TextEditingController puntosLoseController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int? equipoSelecionado1;
  int? equipoSelecionado2;

  String errid = "";
  String errPartId = "";
  String errGanador = "";
  String errPerdedor = "";
  String errPuntosWin = "";
  String errPuntosLose = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nuevo Resultado'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              //TITULO
              //TituloSeccion(titulo: 'Pilotos', subtitulo: 'Agregar'),
              //nombre
              // TextFormField(
              //   decoration: InputDecoration(labelText: 'id'),
              //   controller: idController,
              //   keyboardType: TextInputType.number,
              // ),
              Text(errid, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'nombre del partido'),
                controller: partidoIdController,
              ),
              Text(errPartId, style: TextStyle(color: Colors.red)),
              //apellido

              FutureBuilder(
                future: HttpService().equipos(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Cargando equipos...');
                  }
                  List<dynamic> equipos = snapshot.data;
                  equipoSelecionado1 = equipoSelecionado1 ?? equipos[0]['id'];
                  return DropdownButtonFormField<int>(
                    value: equipoSelecionado1,
                    items: equipos.map<DropdownMenuItem<int>>((equipo) {
                      return DropdownMenuItem<int>(
                        child: Text(equipo['nombre']),
                        value: equipo['id'],
                      );
                    }).toList(),
                    onChanged: (opcionSeleccionada) {
                      print(equipoSelecionado1);
                      equipoSelecionado1 = opcionSeleccionada!;
                    },
                  );
                },
              ),
              FutureBuilder(
                future: HttpService().equipos(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Cargando equipos...');
                  }
                  List<dynamic> equipos = snapshot.data;
                  equipoSelecionado2 = equipoSelecionado2 ?? equipos[0]['id'];
                  return DropdownButtonFormField<int>(
                    value: equipoSelecionado2,
                    items: equipos.map<DropdownMenuItem<int>>((equipo) {
                      return DropdownMenuItem<int>(
                        child: Text(equipo['nombre']),
                        value: equipo['id'],
                      );
                    }).toList(),
                    onChanged: (opcionSeleccionada) {
                      print(equipoSelecionado2);
                      equipoSelecionado2 = opcionSeleccionada!;
                    },
                  );
                },
              ),
              //apellido
              TextFormField(
                decoration: InputDecoration(labelText: 'Puntos del ganador'),
                controller: puntosWinController,
              ),
              Text(errPuntosWin, style: TextStyle(color: Colors.red)),
              //apellido
              TextFormField(
                decoration: InputDecoration(labelText: 'Puntos del perdedor'),
                controller: puntosLoseController,
              ),
              Text(errPuntosLose, style: TextStyle(color: Colors.red)),

              //boton
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      //backgroundColor: Color(kSecondaryColor),
                      ),
                  child: Text('Agregar Partido'),
                  onPressed: () async {
                    var respuesta = await HttpService().resultadosAgregar(
                      int.tryParse(idController.text) ?? 0,
                      partidoIdController.text,
                      equipoSelecionado1!,
                      equipoSelecionado2!,
                      int.tryParse(puntosWinController.text) ?? 0,
                      int.tryParse(puntosLoseController.text) ?? 0,
                    );

                    print(respuesta['message']);
                    if (respuesta['message'] != null) {
                      //hay errores de validación
                      var errores = respuesta['errors'];
                      setState(() {
                        errPartId = errores['partido_id'] != null
                            ? errores['partido_id'][0]
                            : '';
                        errGanador = errores['equipo_ganador'] != null
                            ? errores['equipo_ganador'][0]
                            : '';
                        errid = errores['id'] != null ? errores['id'][0] : '';
                        errPerdedor = errores['equipo_perdedor'] != null
                            ? errores['equipo_perdedor'][0]
                            : '';
                        errPuntosWin = errores['puntos_ganador'] != null
                            ? errores['puntos_ganador'][0]
                            : '';
                        errPuntosLose = errores['puntos_perdedor'] != null
                            ? errores['puntos_perdedor'][0]
                            : '';
                      });
                    } else {
                      //todo ok, volver a la pagina que lista
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
