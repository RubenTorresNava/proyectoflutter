import 'package:flutter/material.dart';
import 'package:reporte/Screens/perfil.dart';
import 'package:reporte/Services/firebase_services.dart';

class Actualizar extends StatelessWidget {
  const Actualizar({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController nombre=TextEditingController(text: "");
    TextEditingController usuario=TextEditingController(text: "");
    TextEditingController telefonoE=TextEditingController(text: "");
    TextEditingController sangre=TextEditingController(text: "");
    TextEditingController alergias=TextEditingController(text: "");
    TextEditingController correo=TextEditingController(text: "");

    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    nombre.text = arguments['nombre'];
    usuario.text = arguments['usuario'];
    telefonoE.text = arguments['telefonoE'];
    sangre.text = arguments['sangre'];
    alergias.text = arguments['alergias'];
    correo.text = arguments['correo'];

    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Actualizar datos',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Ingresa los datos a actualizar",
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
                        await actualizarUsuario(arguments['uid'], nombre.text, usuario.text, telefonoE.text, sangre.text, correo.text, alergias.text)
                            .then((_) {
                          Navigator.pop(context);
                        });
                        },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 40, 243, 33),// Fondo verde
                        onPrimary: Colors.white, // Texto blanco
                      ),
                      child: const Text('Actualizar'),
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
