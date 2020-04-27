import 'package:flutter/material.dart';
import 'package:flutter_gui_projeto_anotacoes/back/BancoDeDadosHelper.dart';
import 'package:flutter_gui_projeto_anotacoes/model/Anotacao.dart';

class ListaAnotacoesHelper{

  List< Anotacao >listaAnotacoes = List(); 
  BancoDeDadosHelper bancoDados;

  ListaAnotacoesHelper(BancoDeDadosHelper bd){
    this.bancoDados = bd;
  }
  
  recuperarAnotacoes(){

    List<Map> dados = bancoDados.read();
    List< Anotacao > anotacoes = List();
    for(var map in dados){
      Anotacao anotacao = Anotacao.toAnotacao(map);
      anotacoes.add(anotacao);
    }

    return anotacoes;
  }

}