import 'package:flutter/material.dart';

enum SearchBy{ITEMS}
class AppProvider with ChangeNotifier{
  bool isLoading = false;
  SearchBy search = SearchBy.ITEMS;
  int totalPrice = 0;
  int priceSum = 0;
  int quantitySum = 0;

  void ChangeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeSearchBy({required SearchBy newSearchBy}) {
    search = newSearchBy;
    notifyListeners();
  }

  addPrice({required int newPrice}){
    priceSum += newPrice;
    notifyListeners();
  }

  addQuantity({required int newQuantity}){
    quantitySum += newQuantity;
    notifyListeners();
  }

  getTotalPrice(){
    print("THE TOTAL SUM IS: $priceSum");
    print("THE QUANTITY SUM IS: $quantitySum");

    totalPrice = priceSum * quantitySum;
    print("THE TOTAL AMOUNT IS: $totalPrice");

    notifyListeners();
  }
}