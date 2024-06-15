import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class CampeonatosAgregar extends StatefulWidget {
  const CampeonatosAgregar({Key? key}) : super(key: key);

  @override
  State<CampeonatosAgregar> createState() => _CampeonatosAgregarState();
}

class _CampeonatosAgregarState extends State<CampeonatosAgregar> {
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController detallesController = TextEditingController();
  TextEditingController reglasController = TextEditingController();
  TextEditingController premiosController = TextEditingController();
  TextEditingController fecha_inicioController = TextEditingController();
  TextEditingController fecha_finController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String errid = "";
  String errNombre = "";
  String errDetalles = "";
  String errFecha_inicio = "";
  String errFecha_fin = "";
  String errPremios = "";
  String errReglas = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nuevo Campeonato'),
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
                decoration: InputDecoration(labelText: 'Nombre del campeonato'),
                controller: nombreController,
              ),
              Text(errNombre, style: TextStyle(color: Colors.red)),
              //apellido
              TextFormField(
                decoration: InputDecoration(labelText: 'Juego'),
                controller: detallesController,
              ),
              Text(errDetalles, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'premios'),
                controller: premiosController,
              ),
              Text(errPremios, style: TextStyle(color: Colors.red)),
              //apellido
              TextFormField(
                decoration: InputDecoration(labelText: 'reglas'),
                controller: reglasController,
              ),
              Text(errReglas, style: TextStyle(color: Colors.red)),
              //apellido
              TextFormField(
                decoration: InputDecoration(labelText: 'fecha de inicio'),
                controller: fecha_inicioController,
              ),
              Text(errFecha_inicio, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'fecha de finalización'),
                controller: fecha_finController,
              ),
              Text(errFecha_fin, style: TextStyle(color: Colors.red)),
              // FutureBuilder(
              //   future: HttpService().paises(),
              //   builder: (context, AsyncSnapshot snapshot) {
              //     if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
              //       return Text('Cargando paises...');
              //     }
              //     List<dynamic> paises = snapshot.data;
              //     return DropdownButtonFormField<String>(
              //       // items: [
              //       //   DropdownMenuItem<String>(child: Text('Opción 1'), value: 'op1'),
              //       //   DropdownMenuItem<String>(child: Text('Opción 2'), value: 'op2'),
              //       // ],
              //       value: paisSeleccionado,
              //       items: paises.map<DropdownMenuItem<String>>((pais) {
              //         return DropdownMenuItem<String>(
              //           child: Text(pais['name']['common']),
              //           value: pais['name']['common'],
              //         );
              //       }).toList(),
              //       onChanged: (opcionSeleccionada) {
              //         paisSeleccionado = opcionSeleccionada!;
              //         print('PAIS: $paisSeleccionado');
              //       },
              //     );
              //   },
              // ),
              // Text(errPais, style: TextStyle(color: Colors.red)),
              // //numero
              // TextFormField(
              //   decoration: InputDecoration(labelText: 'Número'),
              //   controller: numeroController,
              //   keyboardType: TextInputType.number,
              // ),
              // Text(errNumero, style: TextStyle(color: Colors.red)),
              // //equipos
              // FutureBuilder(
              //   future: HttpService().equipos(),
              //   builder: (context, AsyncSnapshot snapshot) {
              //     if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
              //       return Text('Cargando equipos...');
              //     }
              //     List<dynamic> equipos = snapshot.data;
              //     equipoSeleccionado = equipoSeleccionado ?? equipos[0]['id'];
              //     return DropdownButtonFormField<int>(
              //       value: equipoSeleccionado,
              //       items: equipos.map<DropdownMenuItem<int>>((equipo) {
              //         return DropdownMenuItem<int>(
              //           child: Text(equipo['nombre']),
              //           value: equipo['id'],
              //         );
              //       }).toList(),
              //       onChanged: (opcionSeleccionada) {
              //         equipoSeleccionado = opcionSeleccionada!;
              //       },
              //     );
              //   },
              // ),
              //Text(errEquipo, style: TextStyle(color: Colors.red)),
              //boton
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      //backgroundColor: Color(kSecondaryColor),
                      ),
                  child: Text('Agregar campeonato'),
                  onPressed: () async {
                    var respuesta = await HttpService().campeonatosAgregar(
                      int.tryParse(idController.text) ?? 0,
                      nombreController.text,
                      detallesController.text,
                      premiosController.text,
                      reglasController.text,
                      fecha_inicioController.text,
                      fecha_finController.text,
                    );

                    print(respuesta['message']);
                    if (respuesta['message'] != null) {
                      //hay errores de validación
                      var errores = respuesta['errors'];
                      setState(() {
                        errNombre = errores['nombre'][0] ?? '';
                        errNombre = errores['nombre'] != null
                            ? errores['nombre'][0]
                            : '';
                        errDetalles = errores['detalles'] != null
                            ? errores['detalles'][0]
                            : '';
                        errid = errores['id'] != null ? errores['id'][0] : '';
                        errPremios = errores['premios'] != null
                            ? errores['premios'][0]
                            : '';
                        errReglas = errores['reglas'] != null
                            ? errores['reglas'][0]
                            : '';
                        errFecha_inicio = errores['fecha_inicio'] != null
                            ? errores['fecha_inicio'][0]
                            : '';
                        errFecha_fin = errores['fecha_fin'] != null
                            ? errores['fecha_fin'][0]
                            : '';
                      });
                      print(errNombre);
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
