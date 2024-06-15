import 'package:certamen_2/tabs/champ.dart';
import 'package:certamen_2/tabs/jugadores.dart';
import 'package:certamen_2/tabs/partidas.dart';
import 'package:certamen_2/tabs/resultados.dart';
import 'package:certamen_2/tabs/tim.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indice = 0;
  List<Widget> paginas = [
    Champ(),
    Tim(),
    Rounds(),
    Results(),
    Play(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Campeonatos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Equipos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Partidas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ads_click),
            label: 'Resultados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Jugadores',
          ),
        ],
        currentIndex: indice,
        onTap: (opcionSelec) {
          print('OPCION SELECCIONADA: $opcionSelec');
          indice = opcionSelec;
          setState(() {});
        },
      ),
    );
  }
}
