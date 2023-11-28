import 'package:flutter/material.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Inicia sesion para ver tus lugares favorítos"),
                Image.asset("assets/estrella-comentario-alt.png", height: 40, width: 40),
              ],
            ),
          ),
          ),
      );
  }
}
