
import 'package:flutter/material.dart';
import 'package:reporte/Screens/login.dart';


class AppRouter{
  // Ruta inicial
  static const initialRoute='login';

  // Arreglo con las demas rutas 
  

  //Crear un Mapa para agregar las rutas de manera dinamica a una funcion para posteriormente 
  //utilizar la funcion para apuntar a la ruta correcta
  static Map<String, Widget Function(BuildContext)>getAppRouter(){
        Map<String, Widget Function(BuildContext)>appRoutes={};
        appRoutes.addAll({'login':(BuildContext context) => const Login()});

    return appRoutes;
  }

  //Crear o generar alguna ruta adicional para que se utilice cuando no encuentre
  //screen o alguna ruta ren particular
  static Route<dynamic> onGenerationRoute(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) => const Login() , 
      );
  }

}