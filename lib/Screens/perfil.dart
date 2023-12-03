import 'package:flutter/material.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/perfil.jpeg'),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0),
                    Text(
                      'Ruben Torres Nava',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'rubenbebe@gmail.com',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  width: 500,
                  child: Align(
                    alignment: Alignment.center,
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
                      onHover: (value) {
                        setState(() {
                          isHovered = value;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isHovered ? const Color.fromARGB(255, 40, 243, 33) : Colors.black, // Cambiar el color al hacer hover
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          "Editar Perfil",
                          style: TextStyle(
                            color: Colors.white, // Color del texto del botón
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            _buildInfoRow('Contacto de Emergencia: Mamá de Ruben', ''),
            const SizedBox(height: 5.0),
            _buildInfoRow('Número de Emergencia: 6181234567', ''),
            const SizedBox(height: 5.0),
            _buildInfoRow('Dirección: El Huizache', ''),
            const SizedBox(height: 5.0),
            _buildInfoRow('Tipo de Sangre: O+', ''),
            const SizedBox(height: 5.0),
            _buildInfoRow('Alergias: Todas', ''),
            const SizedBox(height: 5.0),
            const SizedBox(height: 140.0),
            const Text(
              'Compartir mis viajes en...',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
