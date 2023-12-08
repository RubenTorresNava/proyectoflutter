import 'package:flutter/material.dart';
import 'package:reporte/Screens/comida.dart';
import 'package:reporte/Screens/hoteles.dart';
import 'package:reporte/Screens/intereses.dart';
import 'package:reporte/Screens/tendencia.dart';
import 'package:reporte/Screens/viajes.dart';

class Lugares extends StatefulWidget {
  const Lugares({Key? key}) : super(key: key);

  @override
  _LugaresState createState() => _LugaresState();
}

class _LugaresState extends State<Lugares> {
  int _hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildContainer(
              "Lugares para visitar",
              "assets/marcador-de-mapa.png",
              TendenciaScreen(),
              0,
            ),
            buildContainer(
              "Lugares para conocer",
              "assets/futbol.png",
              ViajesScreen(),
              1,
            ),
            buildContainer(
              "Intereses",
              "assets/tour-virtual.png",
              const InteresesScreen(),
              2,
            ),
            buildContainer(
              "Lugares para comer",
              "assets/comida.png",
              Comida(),
              3,
            ),
            buildContainer(
              "Hoteles",
              "assets/hotel.png",
              Hoteles(),
              4,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String text, String imagePath, Widget screen, int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TendenciaScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViajesScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InteresesScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Comida()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Hoteles()),
              );
              break;
          }
        },
        onHover: (isHovered) {
          setState(() {
            _hoverIndex = isHovered ? index : -1;
          });
        },
        child: Container(
          height: 100,
          color: _hoverIndex == index ?const Color.fromARGB(255, 40, 243, 33) : Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              const SizedBox(width: 10,),
              Image.asset(imagePath, height: 30, width: 30),
            ],
          ),
        ),
      ),
    );
  }
}
