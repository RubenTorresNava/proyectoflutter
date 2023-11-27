import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'models.dart';

class DatabaseAgencia{
  static final DatabaseAgencia instance=DatabaseAgencia._init();
  static Database?_database;
  DatabaseAgencia._init();
  final String tablaUsuario='usuario';
  Future<Database>get database async{
    if(_database != null) return _database!;
    _database=await _initDB('agencia.db');
    return _database!;
  }
  Future<Database> _initDB(String filePath) async{
    final dbPath=await getDatabasesPath();
      final path=join (dbPath,filePath);
      return await openDatabase(path, onCreate: _onCreateDB);
  }
  Future _onCreateDB(Database db, int version) async{
    await db.execute(''' CREATE TABLE $tablaUsuario(
     id INTEGER PRIMARY KEY,
     nombre TEXT,
     apellido TEXT,
     correo TEXT,
     contraseña TEXT,
     )''');
  }
  Future<void> insert(Usuario usuario) async{
    final db=await instance.database;
    await db.insert(tablaUsuario , usuario.toMap());
  }
}