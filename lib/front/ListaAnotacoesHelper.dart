import 'package:flutter/material.dart';
import 'package:flutter_gui_projeto_anotacoes/back/BancoDeDadosHelper.dart';
import 'package:flutter_gui_projeto_anotacoes/model/Anotacao.dart';

class ListaAnotacoesHelper{

  List< Anotacao > _listaAnotacoes = List(); 
  BancoDeDadosHelper _bancoDeDados;

  set listaAnotacoes(var valor) => _listaAnotacoes = valor;

  ListaAnotacoesHelper(BancoDeDadosHelper bancoDeDados){
    this._bancoDeDados = bancoDeDados;
  }
  
  recuperarAnotacoes() async {
    print("esta sim");
    var dados = await _bancoDeDados.read();
    var listaTemporaria = List< Anotacao >();
    // print(dados);
    for(var map in dados){
      Anotacao anotacao = Anotacao.toAnotacao(map);
      listaTemporaria.add(anotacao);
    }

    listaAnotacoes = listaTemporaria;

    // print(_listaAnotacoes);
  }

  Widget mostrarLista(){
    // recuperarAnotacoes();
    print(_listaAnotacoes);
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _listaAnotacoes.length,  
            itemBuilder: (context, index){

              Anotacao anotacao = _listaAnotacoes[index];

              return Card(
                child: ListTile(
                  title: Text( anotacao.titulo ),
                  subtitle: Text( "${anotacao.data} - ${anotacao.descricao}" ),
                )
              );
            }
          )
        )
      ],
    );
  }
}