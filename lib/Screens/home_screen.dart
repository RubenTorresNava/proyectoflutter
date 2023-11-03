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
    Text(
      'Favoritos',
      style: optionStyle
    )
  ];
  int titloSelect=0;
  static const List<Widget>titulos=<Widget>[
    Text('Inicio'),
    Text('Lugares'),
    Text('Cosas por Hacer'),
    Text('Favoritos')
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
            onPressed: (){
              Navigator.of(context).pushNamed('/cuenta');
            },
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
        indicatorColor: Colors.blue,
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
          NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_outline),
              label: 'Favoritos'
          )
        ],
      ),
      body: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                    hintText: "¿A dónde te gustaría ir?",
                  );
                },
                suggestionsBuilder: (BuildContext context, SearchController controller) {
                  return List<Widget>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.only(top: 200),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Todos los lugares a los que vayas aquí se mostrarán"),
                    Image.asset("assets/mapa.png", height: 40, width: 40),
                  ],
                ),
              ),
            ],
          ),
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
        const Center(
          child: Text("Inicia sesión para ver tus lugares favóritos"),
        )
      ][titloSelect],
    );
  }
}
