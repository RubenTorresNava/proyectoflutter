import 'package:flutter/material.dart';

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Personales'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            CircleAvatar(
              maxRadius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/usuario.png"),
            ),
            SizedBox(height: 20,),
            Text("Ususario invitado"),
          ],
        ),
      ),
    );
  }
}