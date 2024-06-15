import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiUrl = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> campeonatos() async {
    return listarDatos('campeonatos');
  }

  Future<List<dynamic>> equipos() async {
    return listarDatos('equipos');
  }

  Future<List<dynamic>> partidos() async {
    return listarDatos('partidos');
  }

  Future<List<dynamic>> resultados() async {
    return listarDatos('resultados');
  }

  Future<List<dynamic>> jugadores() async {
    return listarDatos('jugadores');
  }

  Future<List<dynamic>> Resultados() async {
    return listarDatos('resultados');
  }

  Future<LinkedHashMap<String, dynamic>> campeonatosAgregar(
      int id,
      String nombre,
      String detalles,
      String premios,
      String reglas,
      String fecha_inicio,
      String fecha_fin) async {
    var url = Uri.parse('$apiUrl/campeonatos');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: json.encode(<String, dynamic>{
        'id': id,
        'nombre': nombre,
        'detalles': detalles,
        'premios': premios,
        'reglas': reglas,
        'fecha_inicio': fecha_inicio,
        'fecha_fin': fecha_fin,
      }),
    );
    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> resultadosAgregar(
      int id,
      String partido_id,
      int equipo_ganador,
      int equipo_perdedor,
      int puntos_ganador,
      int puntos_perdedor) async {
    var url = Uri.parse('$apiUrl/resultados');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: json.encode(<String, dynamic>{
        'id': id,
        'partido_id': partido_id,
        'equipo_ganador': equipo_ganador,
        'equipo_perdedor': equipo_perdedor,
        'puntos_ganador': puntos_ganador,
        'puntos_perdedor': puntos_perdedor,
      }),
    );
    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> partidosAgregar(
      int id,
      String campeonato,
      String equipo_a,
      String equipo_b,
      String fecha_hora,
      String lugar) async {
    var url = Uri.parse('$apiUrl/partidos');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: json.encode(<String, dynamic>{
        'id': id,
        'campeonato': campeonato,
        'equipo_a': equipo_a,
        'equipo_b': equipo_b,
        'fecha_hora': fecha_hora,
        'lugar': lugar,
      }),
    );
    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> equiposAgregar(
      int id, String nombre, String perfil) async {
    var url = Uri.parse('$apiUrl/equipos');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: json.encode(
          <String, dynamic>{'id': id, 'nombre': nombre, 'perfil': perfil}),
    );
    return json.decode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> JugadoresAgregar(
    int id,
    String nombre,
    String apellido,
    String pais,
    String juego,
    int equipo_id,
  ) async {
    var url = Uri.parse('$apiUrl/jugadores');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: json.encode(<String, dynamic>{
        'id': id,
        'nombre': nombre,
        'apellido': apellido,
        'pais': pais,
        'juego': juego,
        'equipo_id': equipo_id
      }),
    );
    return json.decode(respuesta.body);
  }

  Future<bool> borrarCampeonato(int campeonatoId) async {
    var respuesta = await http
        .delete(Uri.parse(apiUrl + '/campeonatos/' + campeonatoId.toString()));
    return respuesta.statusCode == 200;
  }

  Future<bool> borrarPartido(int partidoId) async {
    var respuesta = await http
        .delete(Uri.parse(apiUrl + '/partidos/' + partidoId.toString()));
    return respuesta.statusCode == 200;
  }

  Future<bool> borrarEquipo(int equipoId) async {
    var respuesta = await http
        .delete(Uri.parse(apiUrl + '/equipos/' + equipoId.toString()));
    return respuesta.statusCode == 200;
  }

  Future<bool> borrarResultado(int resultadoId) async {
    var respuesta = await http
        .delete(Uri.parse(apiUrl + '/resultados/' + resultadoId.toString()));
    return respuesta.statusCode == 200;
  }

  Future<bool> borrarJugador(int resultadoId) async {
    var respuesta = await http
        .delete(Uri.parse(apiUrl + '/jugadores/' + resultadoId.toString()));
    return respuesta.statusCode == 200;
  }

  Future<List<dynamic>> listarDatos(String coleccion) async {
    var respuesta = await http.get(Uri.parse(apiUrl + '/' + coleccion));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    }
    print(respuesta.statusCode);
    return [];
  }
}
