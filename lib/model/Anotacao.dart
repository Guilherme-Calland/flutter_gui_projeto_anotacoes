import 'package:flutter/material.dart';

class Anotacao {

  int _id;
  String _titulo;
  String _descricao;
  String _data;

  Anotacao(
    this._titulo,
    this._descricao,
    this._data,
  );

  int get id => _id;

  set id(int value) => _id = value;

  String get titulo => _titulo;

  set titulo(String value) => _titulo = value;

  String get descricao => _descricao;

  set descricao(String value) => _descricao = value;

  String get data => _data;

  set data(String value) => _data = value;

}
