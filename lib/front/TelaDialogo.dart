import 'package:flutter/material.dart';
import 'package:flutter_gui_projeto_anotacoes/back/BancoDeDadosHelper.dart';
import 'package:flutter_gui_projeto_anotacoes/model/Anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TelaDialogo{

  static final TelaDialogo _telaDialogo = TelaDialogo._internal();
  TextEditingController _controladorTitulo = TextEditingController();
  TextEditingController _controladorDescricao = TextEditingController();

  BancoDeDadosHelper _bancoDeDados = BancoDeDadosHelper();

  factory TelaDialogo(){
    return _telaDialogo;
  }

  TelaDialogo._internal(){}

  exibirTelaDialogo(context){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Salve uma anotacao"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Titulo",
                  hintText: 'escolha um titulo'
                ),
                autofocus: true,
                controller: _controladorTitulo,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Descricao',
                  hintText: 'escolha uma descricao'
                ),
                controller: _controladorDescricao,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.red
                )
              ),
              onPressed: (){
                return Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                'Salvar',
                style: TextStyle(
                  color: Colors.green
                ),
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
    String data = _formatarData ( DateTime.now().toString() );
    Anotacao anotacao = Anotacao(titulo, descricao, data);
    int resultado = await _bancoDeDados.create( anotacao );
    print("item salvo, id: $resultado");
    _controladorTitulo.clear();
    _controladorDescricao.clear();
  }

  _formatarData(String data){
    initializeDateFormatting('pt-Br');

    var f = DateFormat.yMMMMd('pt_BR');

    DateTime dataConvertida = DateTime.parse( data );
    String dataFormatada = f.format( dataConvertida );

    return dataFormatada;
  }
}