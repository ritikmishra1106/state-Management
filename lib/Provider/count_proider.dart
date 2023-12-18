
import 'package:flutter/cupertino.dart';
// ChangeNotifier: globaly work karta h same as a set state
class CountProvider with ChangeNotifier{
  int  _count =50;
  int get count =>_count;

  void setCount(){
    _count++;
    notifyListeners();
  }
}
