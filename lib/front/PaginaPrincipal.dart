import 'package:flutter/material.dart';
import 'package:flutter_gui_projeto_anotacoes/back/BancoDeDadosHelper.dart';
import 'package:flutter_gui_projeto_anotacoes/front/ListaAnotacoesHelper.dart';
import 'package:flutter_gui_projeto_anotacoes/front/TelaDialogo.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {

  BancoDeDadosHelper bancoDeDados;
  TelaDialogo telaDialogo;
  ListaAnotacoesHelper listaHelper;
  
  @override
  void initState(){
    super.initState();
    print('oi');
    listaHelper = ListaAnotacoesHelper(bancoDeDados);
    listaHelper.recuperarAnotacoes();
  }

  @override
  Widget build(BuildContext context) {

    bancoDeDados = BancoDeDadosHelper();
    telaDialogo = TelaDialogo(bancoDeDados);

    var pink = Color(0xffff8cf4);
    var green = Colors.green;
    var corTema = pink;


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