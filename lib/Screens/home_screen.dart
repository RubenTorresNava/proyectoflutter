import 'package:flutter/material.dart';
import 'package:reporte/Screens/perfil.dart';
import 'package:reporte/Screens/screens.dart';
  
class navar extends StatefulWidget {
  const navar({super.key});

  @override
  State<navar> createState() =>
      navprincipal();
}
// ignore: camel_case_types
class navprincipal extends State<navar> {
  int textoSelect = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  int titloSelect=0;
  static const List<Widget>titulos=<Widget>[
    Text('Inicio'),
    Text('Lugares'),
    // Text('Cosas por Hacer'),
    Text('Favoritos'),
    Text('Cuenta')
  ];
  int pantallaIndex = 0;
  final List<Widget> pantallas = [
  const Inicio(),
  const Lugares(),
  const Favoritos(),
  const Perfil(),
  
  ];

  void onTabTapped(int index) {
  setState(() {
  pantallaIndex = index;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  titulos.elementAt(titloSelect),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded),
            tooltip: "Cuenta",
            onPressed: (){
              Navigator.of(context).pushNamed('/cuenta');
            },
          ),
        ],
      ),
      body: pantallas[pantallaIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            titloSelect = index;
            textoSelect = index;
            pantallaIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 40, 243, 33),
        selectedIndex:titloSelect,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.business),
            label: 'Lugares',
          ),
          NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_outline),
              label: 'Favoritos'
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person),
            label: 'Cuenta',
          )
        ],
      ),
    );
  }
}
