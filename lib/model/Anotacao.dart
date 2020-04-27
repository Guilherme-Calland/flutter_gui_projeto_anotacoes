class Anotacao{

  int _id;
  String _titulo;
  String _descricao;
  String _data;

  Anotacao(this._titulo, this._descricao, this._data);

  toMap(){
    Map map = { 
      'id' : this._id,
      'titulo' : this._titulo,
      'descricao' : this._descricao,
      'data' : this._data
    };
    return map;
  }

}