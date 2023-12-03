import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InteresesScreen extends StatefulWidget {
  const InteresesScreen({Key? key}) : super(key: key);

  @override
  _InteresesScreenState createState() => _InteresesScreenState();
}

class _InteresesScreenState extends State<InteresesScreen> {
  int _hoveredIndex = -1;

  List<String> imageUrls = [
    'https://maps.app.goo.gl/xyZnCiHUX3DZmcAJ9',
    'https://maps.app.goo.gl/Zmz4VdaTngWtcHeS6',
    'https://maps.app.goo.gl/8KJGU8jPPWr462cP8',
    'https://maps.app.goo.gl/FvmKANb7QqhsyQud6',
    'https://maps.app.goo.gl/inB6qqi2tZnT2vaM6',
    'https://www.youtube.com/',
    'https://maps.app.goo.gl/B1vBRPYYQKSuHUzx9',
    'https://maps.app.goo.gl/YpUQdNMAjUcNNBe56',
    'https://maps.app.goo.gl/78ASfbQknCGPHpWS9',
    'https://maps.app.goo.gl/RLJqeBprnF7FcHfx5',
    // Agrega más URLs según sea necesario
  ];

  List<String> assetImagePaths = [
    'assets/images/image_0.jpg',
    'assets/images/image_1.jpg',
    'assets/images/image_2.jpg',
    'assets/images/image_3.jpg',
    'assets/images/image_4.jpg',
    'assets/images/image_5.jpg',
    'assets/images/image_6.jpg',
    'assets/images/image_7.jpg',
    'assets/images/image_8.jpg',
    'assets/images/image_9.jpg',
    // Agrega más rutas según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intereses'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return MouseRegion(
            onEnter: (_) {
              setState(() {
                _hoveredIndex = index;
              });
            },
            onExit: (_) {
              setState(() {
                _hoveredIndex = -1;
              });
            },
            child: GestureDetector(
              onTap: () {
                if (index < imageUrls.length) {
                  _launchURL(imageUrls[index]);
                } else {
                  // Si no es una URL de YouTube, realiza otra acción
                  print('Imagen $index clickeada');
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: _hoveredIndex == index
                          ? const Color.fromARGB(255, 40, 243, 33).withOpacity(0.7)
                          : Colors.transparent,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: index < assetImagePaths.length
                      ? Image.asset(
                          assetImagePaths[index],
                          fit: BoxFit.cover,
                        )
                      : Container(),
                ),
              ),
            ),
          );
        },
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
