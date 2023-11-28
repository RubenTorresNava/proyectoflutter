import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 50,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text("Lugares en tencencia"),
                      SizedBox(width: 10,),
                      Image.asset("assets/marcador-de-mapa.png", height: 30, width: 30),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    height: 50,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Paquetes de viajes"),
                        SizedBox(width: 10,),
                        Image.asset("assets/futbol.png", height: 30, width: 30),
                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    height: 50,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Interes"),
                        SizedBox(width: 10,),
                        Image.asset("assets/tour-virtual.png", height: 30, width: 30),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
