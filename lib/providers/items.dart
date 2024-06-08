import 'package:flutter/material.dart';
import 'package:millionflashapp/helpers/items.dart';
import '../models/items.dart';

class ItemsProvider with ChangeNotifier{
  ItemServices _itemServices = ItemServices();
  List<ItemModel> items = [];
  List<ItemModel> itemsByCategory = [];
  List<ItemModel> itemsByItemsId = [];
  List<ItemModel> itemsSearched = [];  

  ItemsProvider.initialize(){
    _loadItems();
      }

  _loadItems()async{
    items = await _itemServices.getItems();
    notifyListeners();
  }

  loadItemsByCategory({required String categoryName})async{
    itemsByCategory = await _itemServices.getItemsOfCategory(category: categoryName);
    notifyListeners();
  }

  loadItemsByItemsId({required int itemsId})async{
    itemsByItemsId = await _itemServices.getItemsByItemsId(itemsId: itemsId, id: itemsId);
    notifyListeners();
  }

  search({required String itemsName}) async{
    itemsSearched = await _itemServices.searchItems(itemsName: itemsName);
    print("THE NUMBER OF PRODUCTS DETECTED IS: ${itemsSearched.length}");
    notifyListeners();
  }
  
}
  
