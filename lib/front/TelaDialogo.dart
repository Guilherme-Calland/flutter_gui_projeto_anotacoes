import 'package:flutter/material.dart';

class TelaDialogo{

  static final TelaDialogo _telaDialogo = TelaDialogo._internal();
  TextEditingController _controladorTitulo = TextEditingController();
  TextEditingController _controladorDescricao = TextEditingController();

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
                //salvar
                return Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }
}