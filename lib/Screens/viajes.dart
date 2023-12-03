import 'package:flutter/material.dart';

class ViajesScreen extends StatelessWidget {
  ViajesScreen({Key? key}) : super(key: key);

  // Datos de ejemplo para los lugares
  final List<Map<String, String>> lugares = [
    {
      'nombre': 'Nombre De Dios',
      'tiempoLlegada': '45 minutos',
      'imagen': 'assets/ndedios.jpg',
    },
    {
      'nombre': 'Paseo del Viejo Oeste',
      'tiempoLlegada': '20 minutos',
      'imagen': 'assets/viejo_oeste.jpeg',
    },
    {
      'nombre': 'Mexiquillo',
      'tiempoLlegada': '25 minutos',
      'imagen': 'assets/mexiquillo.jpg',
    },
    {
      'nombre': 'Parque Ecologico el Tecuan',
      'tiempoLlegada': '30 minutos',
      'imagen': 'assets/tecuan.jpeg',
    },
    {
      'nombre': 'Otinapa',
      'tiempoLlegada': '15 minutos',
      'imagen': 'assets/otinapa.jpg',
    },
    {
      'nombre': 'Balneario Rancho La Joya',
      'tiempoLlegada': '10 minutos',
      'imagen': 'assets/joya.jpg',
    },
    {
      'nombre': 'Municipio El Salto',
      'tiempoLlegada': '25 minutos',
      'imagen': 'assets/salto.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares Para Conocer'),
      ),
      body: ListView.builder(
        itemCount: lugares.length,
        itemBuilder: (context, index) {
          return _buildLugarCard(lugares[index]);
        },
      ),
    );
  }

  Widget _buildLugarCard(Map<String, String> lugar) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5), // Añade un sombreado
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0), // Borde redondo
                child: AspectRatio(
                  aspectRatio: 2, // Doble de altura
                  child: Image.asset(
                    lugar['imagen']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                lugar['nombre']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Tiempo de llegada: ${lugar['tiempoLlegada']}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
