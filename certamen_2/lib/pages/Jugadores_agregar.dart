import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class JugadoresAgregar extends StatefulWidget {
  const JugadoresAgregar({Key? key}) : super(key: key);

  @override
  State<JugadoresAgregar> createState() => _JugadoresAgregarState();
}

class _JugadoresAgregarState extends State<JugadoresAgregar> {
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController paisController = TextEditingController();
  TextEditingController juegoController = TextEditingController();
  TextEditingController equipoController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int? equipoSelecionado;

  String errid = "";
  String errNombre = "";
  String errApellido = "";
  String errPais = "";
  String errJuego = "";
  String errEquipoId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nuevo Equipo'),
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
                decoration: InputDecoration(labelText: 'Nombre'),
                controller: nombreController,
              ),
              Text(errNombre, style: TextStyle(color: Colors.red)),
              //apellido
              Text(errNombre, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Perfil'),
                controller: apellidoController,
              ),
              Text(errApellido, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Perfil'),
                controller: paisController,
              ),
              Text(errPais, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Perfil'),
                controller: juegoController,
              ),
              Text(errJuego, style: TextStyle(color: Colors.red)),

              FutureBuilder(
                future: HttpService().equipos(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Cargando equipos...');
                  }
                  List<dynamic> equipos = snapshot.data;
                  equipoSelecionado = equipoSelecionado ?? equipos[0]['id'];
                  return DropdownButtonFormField<int>(
                    value: equipoSelecionado,
                    items: equipos.map<DropdownMenuItem<int>>((equipo) {
                      return DropdownMenuItem<int>(
                        child: Text(equipo['nombre']),
                        value: equipo['id'],
                      );
                    }).toList(),
                    onChanged: (opcionSeleccionada) {
                      equipoSelecionado = opcionSeleccionada!;
                    },
                  );
                },
              ),

              //boton
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      //backgroundColor: Color(kSecondaryColor),
                      ),
                  child: Text('Agregar campeonato'),
                  onPressed: () async {
                    var respuesta = await HttpService().JugadoresAgregar(
                        int.tryParse(idController.text) ?? 0,
                        nombreController.text,
                        apellidoController.text,
                        paisController.text,
                        juegoController.text,
                        equipoSelecionado!);

                    print(respuesta['message']);
                    if (respuesta['message'] != null) {
                      //hay errores de validación
                      var errores = respuesta['errors'];
                      setState(() {
                        //errNombre = errores['nombre'][0] ?? '';
                        errNombre = errores['nombre'] != null
                            ? errores['nombre'][0]
                            : '';
                        errApellido = errores['perfil'] != null
                            ? errores['perfil'][0]
                            : '';
                        errid = errores['id'] != null ? errores['id'][0] : '';
                        errPais =
                            errores['pais'] != null ? errores['pais'][0] : '';
                        errJuego =
                            errores['juego'] != null ? errores['juego'][0] : '';
                        errEquipoId = errores['equipo_id'] != null
                            ? errores['equipo_id'][0]
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
