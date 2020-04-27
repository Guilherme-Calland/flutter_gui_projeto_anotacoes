import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {

    var pink = Color(0xffff8cf4);
    var green = Colors.green;
    var corTema = pink;

    return Scaffold(
      appBar: AppBar(
        title: Text("Anotacoes"),
        backgroundColor: corTema,
      ),
      body: null,
      floatingActionButton: FloatingActionButton(
        backgroundColor: corTema,
        foregroundColor: Colors.white,
        onPressed: (){},
        child: Icon(Icons.add)
      ),
    );
  }
}