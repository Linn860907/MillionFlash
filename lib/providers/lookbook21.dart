import 'package:flutter/material.dart';
import '../helpers/lookbook21.dart';
import '../models/lookbook21.dart';

class LookBook21Provider with ChangeNotifier{
  LookBook21Services _lookbook21Services = LookBook21Services();
  List<LookBook21Model> lookbook21 = [];
  


  LookBook21Provider.initialize(){
    loadLookBook21();
  }

  loadLookBook21() async {
    
      lookbook21 = await _lookbook21Services.getLookbook21();
      notifyListeners();
      
  }
}

