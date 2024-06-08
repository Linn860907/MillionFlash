import 'package:flutter/material.dart';

enum SearchBy{ITEMS}
class AppProvider with ChangeNotifier{
  bool isLoading = false;
  SearchBy search = SearchBy.ITEMS;

  void ChangeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changeSearchBy({required SearchBy newSearchBy}) {
    search = newSearchBy;
    notifyListeners();
  }
}