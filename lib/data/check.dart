import 'package:flutter/material.dart';

class Check extends ChangeNotifier {
  bool _drawerCheck = true;
  get getdrawerCheck => _drawerCheck;

  set setdrawerCheck(bool value) {
    _drawerCheck = value;
    notifyListeners();
  }
}
