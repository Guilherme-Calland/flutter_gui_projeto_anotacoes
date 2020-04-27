import 'package:flutter/material.dart';
import 'package:flutter_gui_projeto_anotacoes/back/BancoDeDadosHelper.dart';
import 'package:flutter_gui_projeto_anotacoes/front/ListaAnotacoesHelper.dart';
import 'package:flutter_gui_projeto_anotacoes/front/TelaDialogo.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {

    BancoDeDadosHelper bancoDeDados = BancoDeDadosHelper();
    TelaDialogo telaDialogo = TelaDialogo( bancoDeDados );
    ListaAnotacoesHelper listaHelper = ListaAnotacoesHelper( bancoDeDados );

    var pink = Color(0xffff8cf4);
    var green = Colors.green;
    var corTema = pink;

    @override
    void initState(){
      super.initState();
      listaHelper.recuperarAnotacoes();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Anotacoes"),
        backgroundColor: corTema,
      ),
      body: listaHelper.mostrarLista(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: corTema,
        foregroundColor: Colors.white,
        onPressed: (){
          telaDialogo.exibirTelaDialogo(context, listaHelper);
        },
        child: Icon(Icons.add)
      ),
    );
  }
}