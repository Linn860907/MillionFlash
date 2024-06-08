import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CategoryModel {
  static const NAME = 'name';
  static const ID = 'id';
  static const IMAGE = 'image';
  static const CATEGORY = 'category';


  late String _name;
  late int _id;
  late String _image;
  late String _category;


  // getters

  String get name => _name;
  int get id => _id;
  String get image => _image;
  String get category => _category;

  CategoryModel.fromsnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    _name = data[NAME] ?? '';
    _id = data[ID] ?? 0;
    _image = data[IMAGE] ?? '';
    _category = data[CATEGORY] ?? '';
  }

  
}


// class Category {
//   final String name;
//   final String assets;

// Category({required this.name, required this.assets});

// }