import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getUsuario() async {
  List<Map<String, dynamic>> usuarios = [];
  QuerySnapshot querySnapshot = await db.collection('usuario').get();
  querySnapshot.docs.forEach((documento) {
    Map<String, dynamic> userData = {
      'nombre': documento['nombre'],
      'correo': documento['correo'],
      'usuario': documento['usuario'],
      'sangre':documento['sangre'],
      'telefonoE':documento['telefonoE'],
      'alergias':documento['alergias']
      // Agrega más campos si es necesario
    };
    usuarios.add(userData);
  });
  return usuarios;
}

Future<void>agregarUsuario(String nombre, String correo, String usuario, String pass, String sangre, String telefonoE, String alergias) async{
  await db.collection('usuario').add({"nombre":nombre, "correo":correo, "usuario":usuario, "contraseña":pass, "sangre":sangre, "alergias": alergias, "telefonoE":telefonoE});
}

