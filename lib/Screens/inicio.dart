import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen
          Image.asset(
            'assets/dgo.jpeg', // Reemplaza 'ruta_de_la_imagen/fondo.jpg' con la ruta real de tu imagen de fondo
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              width: 300, // Ajusta el ancho según sea necesario
              height: 300, // Ajusta la altura según sea necesario
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Bordes redondos
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '¡Bienvenido a Go Travel Durango!\nEn esta aplicación podrás encontrar lugares para visitar, comer y conocer\nen tu estancia aquí en Durango\n¡Que lo disfrutes!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Alinea el texto al centro
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
