import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Comida extends StatefulWidget {
  const Comida({Key? key}) : super(key: key);

  @override
  _ComidaState createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
  final TextEditingController _searchController = TextEditingController();

  List<String> opcionesComida = [
    'Hamburguesas',
    'Tacos',
    'Pizza',
    'Sushi',
    'Ramen',
    'Carne',
    'Cafeteria',
    'Postres',
    'Mariscos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comida'),
      ),
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          Positioned(
            top: 10,
            left: 16.0,
            right: 16.0,
            child: Material(
              elevation: 7.0,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '¿Qué deseas comer hoy?',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        String searchTerm = _searchController.text;
                        print('Búsqueda: $searchTerm');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: opcionesComida.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color.fromARGB(255, 40, 243, 33),
                        ),
                        child: Text(
                          opcionesComida[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image.asset(
                      'assets/comida.jpeg', // Ruta del activo
                      width: 350.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 400,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón "Explorar Restaurantes"
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Alerta'),
                            content: const Text('Explorar Restaurantes'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Navigator.of(context).pop();
                                  _launchRestaurantesURL();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      elevation: 8.0,
                    ),
                    child: const Text('Explorar Restaurantes'),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 400,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón "Pedir por Didi Food"
                      _launchDidiFoodURL();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                      elevation: 8.0,
                    ),
                    child: const Text('Pedir por Didi Food'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Función para abrir la URL de Didi Food en el navegador
  void _launchDidiFoodURL() async {
    const url = 'https://www.didiglobal.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }


    void _launchRestaurantesURL() async {
    const url = 'https://www.google.com.mx/maps/search/restaurantes+en+durango/@24.0203019,-104.6759813,14z/data=!3m1!4b1?entry=ttu';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: Comida(),
  ));
}
