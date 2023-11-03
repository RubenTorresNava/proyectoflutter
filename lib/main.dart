import 'package:flutter/material.dart';
import 'package:reporte/Screens/cuenta.dart';
import 'package:reporte/models/navar.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
          '/': (context)=>const navar(),
          '/cuenta': (context)=>Cuenta(),
      },
    );
  }
}
