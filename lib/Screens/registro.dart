import 'package:flutter/material.dart';
import 'package:reporte/Screens/login.dart';
import 'package:reporte/Services/firebase_services.dart';
import 'package:url_launcher/url_launcher.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nombre=TextEditingController(text: "");
    TextEditingController usuario=TextEditingController(text: "");
    TextEditingController pass=TextEditingController(text: "");
    TextEditingController telefonoE=TextEditingController(text: "");
    TextEditingController sangre=TextEditingController(text: "");
    TextEditingController alergias=TextEditingController(text: "");
    TextEditingController correo=TextEditingController(text: "");

    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Registro',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Ingresa los datos correspondientes",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nombre,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Texto negro
                  decoration: InputDecoration(
                    hintText: 'Nombre',
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
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: usuario,
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
                  const SizedBox(height: 20),
                TextFormField(
                  controller: correo,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Texto negro
                  decoration: InputDecoration(
                    hintText: 'Correo',
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
                const SizedBox(height: 20),
                  TextFormField(
                    controller: pass,
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
                const SizedBox(height: 20,),
                const Text("Datos de emergencia (OPCIONALES)",
                style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: telefonoE,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Texto negro
                  decoration: InputDecoration(
                    hintText: 'Numero de Emergencia',
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
                const SizedBox(height: 20,),
                TextFormField(
                  controller: sangre,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Texto negro
                  decoration: InputDecoration(
                    hintText: 'Tipo de sangre',
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
                const SizedBox(height: 20),
                TextFormField(
                  controller: alergias,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Texto negro
                  decoration: InputDecoration(
                    hintText: 'Alergias',
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () async {
                        await agregarUsuario(nombre.text, correo.text, usuario.text, pass.text, sangre.text, telefonoE.text, alergias.text);
                        displayDialogAndroid(context);
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
}
void displayDialogAndroid(BuildContext context) {
  showDialog(
    barrierDismissible: false, //Forzar a que se cierre en la opcion de cerrar
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'Flutter',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.amber,
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Se ha registrado con nosotros.'),
            SizedBox(
              height: 20,
            ),
            FlutterLogo(
              size: 100,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const  Login()),
                );
              },
              child: const Text(
                'Cerrar',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ))
        ],
      );
    },
  );
}