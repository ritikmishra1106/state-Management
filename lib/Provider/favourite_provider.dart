import 'package:flutter/material.dart';

class FavouriteItemProvider with ChangeNotifier{
  List<int> _selectedItem =[];
  List<int> get selectedItem => _selectedItem;

  void addIndex(int value){
    _selectedItem.add(value);
    notifyListeners();
  }
  void removeIndex(int value){
    _selectedItem.remove(value);
    notifyListeners();
  }
}