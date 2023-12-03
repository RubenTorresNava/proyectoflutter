import 'package:flutter/material.dart';

class TendenciaScreen extends StatelessWidget {
  TendenciaScreen({Key? key}) : super(key: key);

  // Datos de ejemplo para los lugares
  final List<Map<String, String>> lugares = [
    {
      'nombre': 'Plaza de Armas Durango',
      'ubicacion': 'Zona Centro, 34000 Durango, Dgo.',
      'telefono': 'S/N',
      'imagen': 'assets/plaza.jpg',
    },
    {
      'nombre': 'Mirador de los Remedios',
      'ubicacion': 'Cerro de Los Remedios, Los Remedios, 34100 Durango, Dgo.',
      'telefono': 'S/N',
      'imagen': 'assets/remedios.jpg',
    },
    {
      'nombre': 'Teleférico Durango',
      'ubicacion': 'Florida 1145, Zona Centro, 34000 Durango, Dgo.',
      'telefono': '6188135133',
      'imagen': 'assets/teleferico.png',
    },
    {
      'nombre': 'Bebeleche Durango',
      'ubicacion': 'Lic. Armando del Castillo Franco Km 1.5, Parque Sahuatoba, Lomas del Parque, 34100 Durango, Dgo.',
      'telefono': '6188272525',
      'imagen': 'assets/bebeleche.jpg',
    },
    {
      'nombre': 'Paseo Durango',
      'ubicacion': 'Blvd. Felipe Pescador, Zona Centro, 34080 Durango, Dgo.',
      'telefono': '987-654-3210',
      'imagen': 'assets/paseo.jpg',
    },
    {
      'nombre': 'Lago de la China',
      'ubicacion': 'Boulevard Guadiana, Parque Guadiana, 34047 Durango, Dgo.',
      'telefono': 'S/N',
      'imagen': 'assets/lago.jpg',
    },
    {
      'nombre': 'Parque Fundidora de Ferreria Durango',
      'ubicacion': 'Domicilio conocido s/n, 34302 La Ferrería, Dgo.',
      'telefono': '6181377811',
      'imagen': 'assets/ferreria.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares Para Visitar'),
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
          height: 200, // Doble de altura
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1, // Hace que la imagen sea cuadrada
                child: Image.asset(
                  lugar['imagen']!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lugar['nombre']!,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      lugar['ubicacion']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Teléfono: ${lugar['telefono']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
