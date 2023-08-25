class ResponseModel {
  bool _isSuccess;
  int _indentifier;
  String detail;
  ResponseModel(this._isSuccess,this._indentifier, {this.detail = "null"});

  int get identifier => _indentifier;
  bool get isSuccess => _isSuccess;
  String get details => detail;

}