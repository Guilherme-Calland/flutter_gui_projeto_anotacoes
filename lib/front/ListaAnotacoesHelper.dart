import 'package:flutter/material.dart';
import 'package:flutter_gui_projeto_anotacoes/back/BancoDeDadosHelper.dart';
import 'package:flutter_gui_projeto_anotacoes/model/Anotacao.dart';

class ListaAnotacoesHelper{

  List< Anotacao >listaAnotacoes = List(); 
  BancoDeDadosHelper _bancoDados;

  ListaAnotacoesHelper(BancoDeDadosHelper bancoDeDados){
    this._bancoDados = bancoDeDados;
  }
  
  recuperarAnotacoes(){

    List<Map> dados = _bancoDados.read();
    List< Anotacao > anotacoes = List();
    for(var map in dados){
      Anotacao anotacao = Anotacao.toAnotacao(map);
      anotacoes.add(anotacao);
    }

    return anotacoes;
  }

  Widget mostrarLista(){

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: listaAnotacoes.length,  
            itemBuilder: (context, index){

              Anotacao anotacao = listaAnotacoes[index];

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