import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getUsuario() async {
  List<Map<String, dynamic>> usuarios = [];
  QuerySnapshot querySnapshot = await db.collection('usuario').get();
  querySnapshot.docs.forEach((documento) {
    // Obtener el ID del documento (uid)
    var uid = documento.id;

    Map<String, dynamic> userData = {
      'uid': uid, // Incluir el identificador único (uid)
      'nombre': documento['nombre'],
      'correo': documento['correo'],
      'usuario': documento['usuario'],
      'sangre': documento['sangre'],
      'telefonoE': documento['telefonoE'],
      'alergias': documento['alergias'],
      // Agrega más campos si es necesario
    };
    usuarios.add(userData);
  });
  return usuarios;
}




Future<void> actualizarUsuario(String uid, String nombre, String usuario, String correo, String telefonoE, String sangre, String alergias) async {
  await db.collection("usuario").doc(uid).set({'nombre': nombre, 'usuario':usuario, 'correo':correo, 'telefonoE':telefonoE, 'sangre':sangre, 'alergias':alergias});
}



