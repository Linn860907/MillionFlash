import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/products.dart';
import '../models/products.dart';


class ProductProvider with ChangeNotifier{
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByItems = [];


  ProductProvider.initialize(){
    _loadProducts();
  }

  _loadProducts()async{
    products = await _productServices.getProducts();
    notifyListeners();
  }

  // Future loadProductByCategory({required String categoryName})async{
  //   productsByCategory = await _productServices.getProductsOfCategory(category: categoryName);
  //   notifyListeners();
  // }

  // Future loadProductByItems({required int itemsId})async{
  //   productsByItems = await _productServices.getProdutsByItems(id: itemsId, itemsId: itemsId);
  //   notifyListeners();
  // }
}