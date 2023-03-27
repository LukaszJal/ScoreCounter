import 'package:flutter/cupertino.dart';

class UserData {
  UserData(this._name, this._avatar);

  String _name;
  Widget _avatar;
  int score = 0;

  String get name => _name;
  Widget get avatar => _avatar;
}
