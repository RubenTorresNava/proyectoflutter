import 'package:flutter/material.dart';
import 'package:reporte/Routes/routes.dart';
import 'package:reporte/Screens/login.dart';

//IMPORTACIONES DE FIREBASE
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:reporte/themes/tema.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //     '/': (context)=>const navar(),
      //     '/cuenta': (context)=>const Cuenta(),
      // },

      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.getAppRouter(),
      onGenerateRoute: AppRouter.onGenerationRoute,
      home: const Login(),


      theme: Tema.TemaApp,
      
    );
  }
}
