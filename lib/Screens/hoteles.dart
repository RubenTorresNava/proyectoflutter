import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class Hoteles extends StatefulWidget {
  Hoteles({Key? key}) : super(key: key);

  @override
  _HotelesState createState() => _HotelesState();
}

class _HotelesState extends State<Hoteles> {
  final List<String> googleMapsLinks = [
    'https://maps.app.goo.gl/xoJF9AXmtdDCUJQdA',
    'https://maps.app.goo.gl/1oqi8txJo7g4DrCD8',
    'https://maps.app.goo.gl/haNurWXi1hq7qXaX7',
    'https://maps.app.goo.gl/YZ3po1oD3UqPmMyK6',
    'https://maps.app.goo.gl/FPKBbEV7ZeGKXFEP6',
    'https://maps.app.goo.gl/bu9KDFGh2UHjvr169',
    'https://maps.app.goo.gl/33HuAmSwKdVvFrVo7',
  ];

  int currentIndex = 0; // Variable local para el índice actual

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoteles'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10.0),
            CarouselSlider(
              options: CarouselOptions(
                height: 500.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index; // Actualizar el índice actual
                  });
                },
              ),
              items: List.generate(
                7,
                (index) => Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Image.asset(
                            'assets/image_hoteles/image_$index.jpg',
                            fit: BoxFit.contain,
                            height: 500.0,
                            width: 600.0,
                          ),
                        ),
                        const Positioned(
                          top: 20.0,
                          child: Text(
                            '¡Encuentra el mejor lugar para descansar!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10.0),

            SizedBox(
              width: 400,
              height: 60.0,
              child: ElevatedButton(
              onPressed: () {
                // Utilizar currentIndex para obtener el enlace de Google Maps
                _launchURL(googleMapsLinks[currentIndex]);
              },
              style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 40, 243, 33),
                      onPrimary: Colors.white,
                      elevation: 8.0,),
              child: const Text('Ver Ahora'),
            ),
            )
            
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
