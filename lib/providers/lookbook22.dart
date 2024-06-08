import 'package:flutter/material.dart';
import '../helpers/lookbook22.dart';
import '../models/lookbook22.dart';

class LookBook22Provider with ChangeNotifier{
  LookBook22Services _lookbook22Services = LookBook22Services();
  List<LookBook22Model> lookbook22 = [];
  


  LookBook22Provider.initialize(){
    _loadLookBook22();
  }

  _loadLookBook22() async {
    
      lookbook22 = await _lookbook22Services.getCategories();
      notifyListeners();
      
  }
}

