import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 50;

  int get count => _count;

  void incrementCounter(){
    _count++;
    notifyListeners();
  }
}