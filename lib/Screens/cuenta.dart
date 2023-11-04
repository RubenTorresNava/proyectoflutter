import 'package:flutter/material.dart';

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
      ),
      body:  Center(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            const CircleAvatar(
              maxRadius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/usuario.png"),
            ),
            const SizedBox(height: 20,),
            const Text("Ususario invitado",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {  },
                child: const Text("Iniciar sesión")
            )
          ],
        ),
      ),
    );
  }
}