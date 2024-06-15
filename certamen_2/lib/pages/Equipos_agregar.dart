import 'package:certamen_2/Services/http_service.dart';
import 'package:flutter/material.dart';

class EquiposAgregar extends StatefulWidget {
  const EquiposAgregar({Key? key}) : super(key: key);

  @override
  State<EquiposAgregar> createState() => _EquiposAgregarState();
}

class _EquiposAgregarState extends State<EquiposAgregar> {
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController perfilController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int? jugadorSelecionado;

  String errid = "";
  String errNombre = "";
  String errPerfil = "";

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
              //TextFormField(
              //  decoration: InputDecoration(labelText: 'id'),
              //  controller: idController,
              //  keyboardType: TextInputType.number,
              //),
              Text(errid, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre del equipo:'),
                controller: nombreController,
              ),
              Text(errNombre, style: TextStyle(color: Colors.red)),
              //apellido
              Text(errPerfil, style: TextStyle(color: Colors.red)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Juego:'),
                controller: perfilController,
              ),
              Text(errPerfil, style: TextStyle(color: Colors.red)),
              //apellido
              // FutureBuilder(
              //   future: HttpService().jugadores(),
              //   builder: (context, AsyncSnapshot snapshot) {
              //     if (!snapshot.hasData ||
              //         snapshot.connectionState == ConnectionState.waiting) {
              //       return Text('Cargando jugadores...');
              //     }
              //     List<dynamic> jugadores = snapshot.data;
              //     jugadorSelecionado = jugadorSelecionado ?? jugadores[0]['id'];
              //     return DropdownButtonFormField<int>(
              //       value: jugadorSelecionado,
              //       items: jugadores.map<DropdownMenuItem<int>>((jugador) {
              //         return DropdownMenuItem<int>(
              //           child: Text(jugador['nombre']),
              //           value: jugador['id'],
              //         );
              //       }).toList(),
              //       onChanged: (opcionSeleccionada) {
              //         jugadorSelecionado = opcionSeleccionada!;
              //       },
              //     );
              //   },
              // ),

              //boton
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      //backgroundColor: Color(kSecondaryColor),
                      ),
                  child: Text('Inscribir Equipo'),
                  onPressed: () async {
                    var respuesta = await HttpService().equiposAgregar(
                        int.tryParse(idController.text) ?? 0,
                        nombreController.text,
                        perfilController.text
                        //jugadorSelecionado!
                        );

                    print(respuesta['message']);
                    if (respuesta['message'] != null) {
                      //hay errores de validación
                      var errores = respuesta['errors'];
                      setState(() {
                        //errNombre = errores['nombre'][0] ?? '';
                        errNombre = errores['nombre'] != null
                            ? errores['nombre'][0]
                            : '';
                        errPerfil = errores['perfil'] != null
                            ? errores['perfil'][0]
                            : '';
                        errid = errores['id'] != null ? errores['id'][0] : '';
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
