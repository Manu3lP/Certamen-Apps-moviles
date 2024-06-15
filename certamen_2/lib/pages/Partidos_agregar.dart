import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class PartidosAgregar extends StatefulWidget {
  const PartidosAgregar({Key? key}) : super(key: key);

  @override
  State<PartidosAgregar> createState() => _PartidosAgregarState();
}

class _PartidosAgregarState extends State<PartidosAgregar> {
  TextEditingController idController = TextEditingController();
  TextEditingController campeonatoIdController = TextEditingController();
  TextEditingController equipoAidController = TextEditingController();
  TextEditingController equipoBidController = TextEditingController();
  TextEditingController fechaHoraController = TextEditingController();
  TextEditingController lugarController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // int? equipoSelecionado1;
  // int? equipoSelecionado2;

  String errid = "";
  String errCampId = "";
  String errEquipoA = "";
  String errEquipoB = "";
  String errFechaHora = "";
  String errLugar = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nuevo Partido'),
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
              //TextFormField(
              //  decoration: InputDecoration(labelText: 'id'),
              //  controller: idController,
              //  keyboardType: TextInputType.number,
              //),
              Text(errid, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'nombre del campeonato'),
                controller: campeonatoIdController,
              ),
              Text(errCampId, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'equipo 1'),
                controller: equipoAidController,
              ),
              Text(errEquipoA, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'equipo 2'),
                controller: equipoBidController,
              ),
              Text(errEquipoB, style: TextStyle(color: Colors.red)),
              //apellido
              // FutureBuilder(
              //   future: HttpService().equipos(),
              //   builder: (context, AsyncSnapshot snapshot) {
              //     if (!snapshot.hasData ||
              //         snapshot.connectionState == ConnectionState.waiting) {
              //       return Text('Cargando equipos...');
              //     }
              //     List<dynamic> equipos = snapshot.data;
              //     equipoSelecionado1 = equipoSelecionado1 ?? equipos[0]['id'];
              //     return DropdownButtonFormField<int>(
              //       value: equipoSelecionado1,
              //       items: equipos.map<DropdownMenuItem<int>>((equipo) {
              //         return DropdownMenuItem<int>(
              //           child: Text(equipo['nombre']),
              //           value: equipo['id'],
              //         );
              //       }).toList(),
              //       onChanged: (opcionSeleccionada1) {
              //         equipoSelecionado1 = opcionSeleccionada1!;
              //       },
              //     );
              //   },
              // ),
              // Text(errEquipoA, style: TextStyle(color: Colors.red)),
              // FutureBuilder(
              //   future: HttpService().equipos(),
              //   builder: (context, AsyncSnapshot snapshot) {
              //     if (!snapshot.hasData ||
              //         snapshot.connectionState == ConnectionState.waiting) {
              //       return Text('Cargando equipos...');
              //     }
              //     List<dynamic> equipos = snapshot.data;
              //     equipoSelecionado2 = equipoSelecionado2 ?? equipos[0]['id'];
              //     return DropdownButtonFormField<int>(
              //       value: equipoSelecionado2,
              //       items: equipos.map<DropdownMenuItem<int>>((equipo) {
              //         return DropdownMenuItem<int>(
              //           child: Text(equipo['nombre']),
              //           value: equipo['id'],
              //         );
              //       }).toList(),
              //       onChanged: (opcionSeleccionada2) {
              //         equipoSelecionado2 = opcionSeleccionada2!;
              //       },
              //     );
              //   },
              // ),
              //apellido
              TextFormField(
                decoration: InputDecoration(labelText: 'Hora'),
                controller: fechaHoraController,
              ),
              Text(errFechaHora, style: TextStyle(color: Colors.red)),
              //apellido
              TextFormField(
                decoration: InputDecoration(labelText: 'Lugar'),
                controller: lugarController,
              ),
              Text(errLugar, style: TextStyle(color: Colors.red)),

              //boton
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      //backgroundColor: Color(kSecondaryColor),
                      ),
                  child: Text('Agregar Partido'),
                  onPressed: () async {
                    var respuesta = await HttpService().partidosAgregar(
                        int.tryParse(idController.text) ?? 0,
                        campeonatoIdController.text,
                        equipoAidController.text,
                        equipoBidController.text,
                        fechaHoraController.text,
                        lugarController.text);

                    print(respuesta['message']);
                    if (respuesta['message'] != null) {
                      //hay errores de validación
                      var errores = respuesta['errors'];
                      setState(() {
                        errid = errores['id'] != null ? errores['id'][0] : '';
                        errCampId = errores['campeonato'] != null
                            ? errores['campeonato'][0]
                            : '';
                        errEquipoA = errores['equipo_a'] != null
                            ? errores['equipo_a'][0]
                            : '';
                        errEquipoB = errores['equipo_b'] != null
                            ? errores['equipo_b'][0]
                            : '';

                        errFechaHora = errores['fecha_hora'] != null
                            ? errores['fecha_hora'][0]
                            : '';
                        errLugar =
                            errores['lugar'] != null ? errores['lugar'][0] : '';
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
