import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {

    var rosa = Color(0xffff8df4);
    var corTemaApp = Colors.green;

    return Scaffold(
      appBar: AppBar(
        title: Text("Anotacoes"),
        backgroundColor: corTemaApp,
      ),
    );
  }
}