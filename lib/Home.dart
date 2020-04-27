import 'package:flutter/material.dart';
import 'package:flutter_gui_projeto_anotacoes/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controladorTitulo = TextEditingController();
  TextEditingController _controladorDescricao = TextEditingController();
  BancoDadosAuxilio bancoDados = BancoDadosAuxilio();

  _mostrarTelaDialogo(){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('salvar anotacao'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'titulo',
                  hintText: 'digite um titulo'
                ),
                controller: _controladorTitulo,
                autofocus: true
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'descricao',
                  hintText: 'digite uma descricao'
                ),
                controller: _controladorDescricao
              ),
            ],
          ),
          actions: <Widget>[
            RaisedButton(
              child: Text(
                'cancelar',
                style: TextStyle(
                  color: Colors.red
                )
              ),
              onPressed: (){
                return Navigator.pop(context);
              }
            ),
            RaisedButton(
              child: Text(
                'salvar',
                style: TextStyle(
                  color: Colors.green
                )
              ),
              onPressed: (){
                _salvarAnotacao();
                return Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }

  _salvarAnotacao() async {
    String titulo = _controladorTitulo.text;
    String descricao = _controladorDescricao.text;
    String data = _formatarData( DateTime.now().toString() );
    Anotacao anotacao = Anotacao(titulo, descricao, data);
    int resposta = await bancoDeDados.create();
  }

  _formatarData(String data){
    initializeDateFormatting('pt-Br');
    var f = DateFormat.yMMMMd('pt-BR');
    DateTime dataConvertida = DateTime.parse( data );
    String dataFormatada = f.format( dataConvertida );
    return dataFormatada;
  }

  @override
  Widget build(BuildContext context) {



    var corTema = Colors.blue;

    return Scaffold(
      appBar: AppBar(
        title: Text("Anotacoes"),
        backgroundColor: corTema,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: corTema,
        onPressed: (){
          _mostrarTelaDialogo();
        },
      ),
    );
  }
}