import 'package:flutter/material.dart';
import '../models/navar.dart';

class navprincipal extends State<navar> {
  int textoSelect = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
        Container(
          padding: const EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 50,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text("Lugares en tencencia"),
                      SizedBox(width: 10,),
                      Image.asset("assets/marcador-de-mapa.png", height: 30, width: 30),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    height: 50,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Paquetes de viajes"),
                        SizedBox(width: 10,),
                        Image.asset("assets/futbol.png", height: 30, width: 30),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    height: 50,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Interes"),
                        SizedBox(width: 10,),
                        Image.asset("assets/tour-virtual.png", height: 30, width: 30),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
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
              SizedBox(height: 10), // Agrega un espacio entre SearchAnchor y el ListView
              Container(
                alignment: Alignment.center,
                height: 300,
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
                          children: [
                            Text("Lugares que no debes perderte"),
                            SizedBox(width: 10),
                            Image.asset("assets/construccion-de-casas.png", width: 30, height: 30),
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(height: 10), // Agrega un espacio entre los elementos del ListView
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 100,
                        color: Colors.grey[200],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dónde comer"),
                            SizedBox(width: 10),
                            Image.asset("assets/refresco-de-hamburguesa.png", height: 30, width: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    height: 100,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Puntos de interes"),
                        SizedBox(width: 10,),
                        Image.asset("assets/tour-virtual.png", height: 30, width: 30),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Inicia sesion para ver tus lugares favorítos"),
              Image.asset("assets/estrella-comentario-alt.png", height: 40, width: 40),
            ],
          ),
        ),
      ][titloSelect],
    );
  }
}
