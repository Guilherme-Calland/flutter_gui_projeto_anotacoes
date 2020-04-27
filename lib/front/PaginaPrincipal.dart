import 'package:flutter/material.dart';
import 'package:flutter_gui_projeto_anotacoes/front/TelaDialogo.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {

    TelaDialogo telaDialogo = TelaDialogo();

    var pink = Color(0xffff8cf4);
    var green = Colors.green;
    var corTema = pink;

    return Scaffold(
      appBar: AppBar(
        title: Text("Anotacoes"),
        backgroundColor: corTema,
      ),
      // body: return ListaAnotacoes.lista
      floatingActionButton: FloatingActionButton(
        backgroundColor: corTema,
        foregroundColor: Colors.white,
        onPressed: (){
          telaDialogo.exibirTelaDialogo(context); 
        },
        child: Icon(Icons.add)
      ),
    );
  }
}