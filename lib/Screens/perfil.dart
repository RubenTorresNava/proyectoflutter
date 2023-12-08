import 'package:flutter/material.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:reporte/Services/firebase_services.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUsuario(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al cargar los datos'),
            );
          } else {
            List<Map<String, dynamic>> usuarios = snapshot.data as List<
                Map<String, dynamic>>;
            if (usuarios.isEmpty) {
              return Center(
                child: Text('No hay datos disponibles'),
              );
            } else {
              return ListView.builder(
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> userData = usuarios[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 60.0,
                              backgroundImage: AssetImage('assets/perfil.jpeg'),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              // Utiliza un Column para organizar verticalmente los elementos
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 16.0),
                                  Text(
                                    'Nombre: ${userData['nombre'] ?? ''}',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Correo electrónico: ${userData['correo'] ??
                                        ''}',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Usuario: ${userData['usuario'] ?? ''}',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  // Otros campos de información
                                  SizedBox(height: 16.0),
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 12.0),
                                      width: 500,
                                      child: InkWell(
                                        onTap: () async {
                                          ArtDialogResponse response = await ArtSweetAlert.show(
                                            barrierDismissible: false,
                                            context: context,
                                            artDialogArgs: ArtDialogArgs(
                                              denyButtonText: "Cancel",
                                              title: "¿Estas segur@",
                                              text: "que deseas editar tu perfil?",
                                              confirmButtonText: "Cambiar",
                                              type: ArtSweetAlertType.warning,
                                            ),
                                          );

                                          // ignore: unnecessary_null_comparison
                                          if (response == null) {
                                            return;
                                          }

                                          if (response.isTapConfirmButton) {
                                            // ignore: use_build_context_synchronously
                                            ArtSweetAlert.show(
                                              context: context,
                                              artDialogArgs: ArtDialogArgs(
                                                type: ArtSweetAlertType.success,
                                                title: "Perfil Editado!",
                                              ),
                                            );
                                            return;
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            // Cambia el color según necesites
                                            borderRadius: BorderRadius.circular(
                                                8.0),
                                          ),
                                          child: const Text(
                                            "Editar Perfil",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  // Más contenido
                                  Text(
                                    'Compartir mis viajes en...',
                                    style: TextStyle(fontSize: 25.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Image.asset(
                                        'assets/instagram.png',
                                        width: 25.0,
                                        height: 25.0,
                                      ),
                                      Image.asset(
                                        'assets/tiktok.png',
                                        width: 25.0,
                                        height: 25.0,
                                      ),
                                      Image.asset(
                                        'assets/facebook.png',
                                        width: 25.0,
                                        height: 25.0,
                                      ),
                                      Image.asset(
                                        'assets/whatsapp.png',
                                        width: 25.0,
                                        height: 25.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        Text("Informacion de emergencia: ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Tipo de sangre: ${userData['sangre'] ?? ''}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Telefono de emergencia: ${userData['telefonoE'] ??
                              ''}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Alergias: ${userData['alergias'] ?? ''}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
    Widget _buildInfoRow(String label, String value) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      );
    }
}



