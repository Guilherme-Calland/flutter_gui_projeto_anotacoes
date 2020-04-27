class Anotacao{

  int _id;
  String _titulo;
  String _descricao;
  String _data;

  Anotacao(this._titulo, this._descricao, this._data);

  toMap(){
    Map<String, dynamic> map = { 
      'titulo' : this._titulo,
      'descricao' : this._descricao,
      'data' : this._data
    };

    if( this._id != null ){
      map['id'] = this._id;
    }
    return map;
  }

}