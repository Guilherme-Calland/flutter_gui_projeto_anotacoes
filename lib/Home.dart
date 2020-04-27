import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controladorTitulo = TextEditingController();
  TextEditingController _controladorDescricao = TextEditingController();

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
                // salvar
                return Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
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