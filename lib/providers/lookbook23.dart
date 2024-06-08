import 'package:flutter/material.dart';
import '../helpers/lookbook23.dart';
import '../models/lookbook23.dart';

class LookBook23Provider with ChangeNotifier{
  LookBook23Services _lookbook23Services = LookBook23Services();
  List<LookBook23Model> lookbook23 = [];
  


  LookBook23Provider.initialize(){
    _loadLookBook23();
  }

  _loadLookBook23() async {
    
      lookbook23 = await _lookbook23Services.getCategories();
      notifyListeners();
      
  }
}

