import 'package:flutter/material.dart';
import 'package:reporte/Screens/home_screen.dart';
// import 'package:reporte/Screens/inicio.dart';
//import 'inicio_screen.dart'; // Asegúrate de importar correctamente la pantalla InicioScreen

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    // Variables para almacenar las credenciales
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo.png', // Reemplaza con la ruta de tu imagen
                width: 300,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              TextField(
                controller: userController,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Texto negro
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  hintStyle: const TextStyle(color: Colors.white), // Hint blanco
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                  fillColor: const Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Texto negro
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle: const TextStyle(color: Colors.white), // Hint blanco
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                  fillColor: const Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Lógica para verificar las credenciales
                  if (userController.text == 'utd' && passwordController.text == '1234') {
                    // Credenciales correctas, redirige a InicioScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const  navar()),
                    );
                  } else {
                    // Credenciales incorrectas, puedes agregar una alerta o mensaje aquí
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Fondo blanco
                  onPrimary: Colors.black, // Texto negro
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Entrar'),
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
