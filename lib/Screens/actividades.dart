import 'package:flutter/material.dart';

class Actividades extends StatelessWidget {
  const Actividades({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 100,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text("Tours"),
                        SizedBox(width: 10,),
                        Image.asset("assets/marcador-de-mapa.png", height: 30, width: 30),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                      height: 100,
                      color: Colors.grey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Deportes"),
                          SizedBox(width: 10,),
                          Image.asset("assets/futbol.png", height: 30, width: 30),
                        ],
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                      height: 100,
                      color: Colors.grey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Puntos de interes"),
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
