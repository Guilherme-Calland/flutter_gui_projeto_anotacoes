import 'package:flutter_gui_projeto_anotacoes/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDeDadosHelper{

  static final BancoDeDadosHelper _bancoDeDadosHelper = BancoDeDadosHelper._internal(); 

  factory BancoDeDadosHelper(){
    return _bancoDeDadosHelper;
  }

  BancoDeDadosHelper._internal(){}

  Database _bancoDeDados;

  get bancoDeDados async {
    if( _bancoDeDados != null ){
      return _bancoDeDados;
    } else {
      _bancoDeDados = await _inicializarBancoDeDados();
      return _bancoDeDados;
    }
  }

  _inicializarBancoDeDados() async {
    final dbPath = await getDatabasesPath();
    final arquivo = join( dbPath, 'bancoDeDados.db');

    var bd = await openDatabase(arquivo, version: 1, onCreate: _inicializar);
  }

  _inicializar(Database bd, int version) async {
    String sql = "CREATE TABLE anotacoes ("
    "id INTEGER PRIMARY KEY AUTOINCREMENT,"
    "titulo VARCHAR, "
    "descricao TEXT, "
    "data DATETIME, "
    ")";
    await bd.execute(sql);
  }

  create(Anotacao anotacao) async {
    var bd = await bancoDeDados;
    int id = await bd.insert('anotacoes', anotacao.toMap() );
    return id;
  }

}