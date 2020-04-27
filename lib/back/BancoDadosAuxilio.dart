import 'package:flutter/material.dart';

class BancoDadosAuxilio{

  static final BancoDadosAuxilio _bancoDadosAuxilio = BancoDadosAuxilio._internal();

  factory BancoDadosAuxilio(){
    return _bancoDadosAuxilio;
  }

  BancoDadosAuxilio._internal(){}
}