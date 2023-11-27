class Usuario{
  final int id;
  final String nombre;
  final String apellido;
  final String correo;
  final String contrasenia;

  Usuario({required this.id, required this.nombre, required this.apellido, required this.correo, required this.contrasenia});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'correo': correo,
      'contraseña': contrasenia
    };
  }
}