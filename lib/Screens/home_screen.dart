import 'package:flutter/material.dart';
import '../models/navar.dart';

class navprincipal extends State<navar> {
  int textoSelect = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> opciones = <Widget>[
    Text(
      'Inicio',
      style: optionStyle,
    ),
    Text(
      'Mis Lugares',
      style: optionStyle,
    ),
    Text(
      'Cosas por Hacer',
      style: optionStyle,
    ),
  ];
  int titloSelect=0;
  static const List<Widget>titulos=<Widget>[
    Text('Inicio'),
    Text('Lugares'),
    Text('Cosas por Hacer'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  titulos.elementAt(titloSelect),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            tooltip: "Cuenta",
            onPressed: (){},
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            titloSelect = index;
            textoSelect = index;
          });
        },
        indicatorColor: Colors.amber[800],
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
            selectedIcon: Icon(Icons.local_activity),
            icon: Icon(Icons.local_activity_outlined),
            label: 'Actividades',
          ),
        ],
      ),
      body: <Widget>[
        Container(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Todos Los lugares a los que vaya aquí se mostrarán"),
                  Image.asset("assets/mapa.png", height: 40, width: 40,),
                ],
              ),
            )

        ),
        Container(
          //color: Colors.green,
          alignment: Alignment.center,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text("Lugares que no debes perderte"),
                      SizedBox(width: 10),
                      Image.asset("assets/construccion-de-casas.png", width: 30, height: 30)
                      ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ha dónde ir"),
                      SizedBox(width: 10,),
                      Image.asset("assets/buscar-ubicacion.png", height: 30, width: 30,)
                      ],
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    height: 100,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text("Dónde comer"),
                        SizedBox(width: 10),
                        Image.asset("assets/refresco-de-hamburguesa.png", height: 30, width: 30,)
                      ]
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                height: 100,
                color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text("Recorridos"),
                      SizedBox(width: 10),
                      Image.asset("assets/ruta.png", height: 30, width: 30)
                    ],
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    height: 100,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text("Tours"),
                        SizedBox(width: 10,),
                        Image.asset("assets/marcador-de-mapa.png", height: 30, width: 30),
                      ],
                    ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Deportes"),
                      SizedBox(width: 10,),
                      Image.asset("assets/futbol.png", height: 30, width: 30),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ][titloSelect],
    );
  }
}
