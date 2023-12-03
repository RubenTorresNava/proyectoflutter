import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("¡Inicia sesión Para acceder a tu cuenta plus!"),
              const SizedBox(height: 20),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/usuario.png"),
                backgroundColor: Colors.white,
                radius: 40,
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción del botón de inicio de sesión
                      _showLoginAlert(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 40, 243, 33), // Fondo verde
                      onPrimary: Colors.white, // Texto blanco
                    ),
                    child: const Text('Iniciar Sesión'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _launchOpenSesionURL();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 40, 243, 33),// Fondo verde
                      onPrimary: Colors.white, // Texto blanco
                    ),
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoginAlert(BuildContext context) {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.success,
        title: "Inicio de Sesion Exitoso",
        text: "Bienvenido Rubebebe",
      ),
    );
  }

  void _launchOpenSesionURL() async {
    const url = 'https://g.co/kgs/Spxfm3';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
