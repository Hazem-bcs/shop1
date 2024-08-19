import 'dart:io';

import 'package:shop/data/model/category.dart';
import 'package:shop/data/model/item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeData {
  final supabase = Supabase.instance.client;
  Future<List<Category>> getListBestCategory() async {
    final response = await supabase.from('categories').select('category_id, category_name, category_image').eq('best', 'TRUE');
    if (response.isNotEmpty) {
      return response.map((category) => Category(
        categoryId: category['category_id'],
        categoryName: category['category_name'],
        categoryImage: category['category_image'],
      ),).toList();
    } else {
      return [];
    }

  }
  Future<List<Item>> getListRecommendedItems() async {
    final response = await supabase.from('categories').select('category_name, sub_categories(items(*))').eq('sub_categories.items.item_recommended', 'TRUE');
    if (response.isNotEmpty){
      return getItemList(response);
    }
    else {
      return [];
    }
  }
  Future<List<Item>> getListBestItems() async {
    final response = await supabase.from('categories').select('category_name, sub_categories(items(*))').eq('sub_categories.items.item_best', 'TRUE');
    if(response.isEmpty) {

      return [];
    }
    else if (response.isNotEmpty){
      return getItemList(response);
    }
    else {
      return [];
    }
  }
  Future<List<Item>> getListMostPopularItems() async {
      final response = await supabase.from('categories').select('category_name, sub_categories(items(*))').eq('sub_categories.items.item_most_popular', 'TRUE');
    if(response.isEmpty) {
      return [];
    }
    else if (response.isNotEmpty){
      return getItemList(response);
    }
    else {
      return [];
    }
  }
  List<Item> getItemList(PostgrestList response) {
    final List<Item> listItems = [];
    for(int categoryIndex = 0 ; categoryIndex<response.length; categoryIndex++) {
      final category = response[categoryIndex];
      String categoryName = category['category_name'];
      for(int subCategoryIndex = 0 ; subCategoryIndex < category['sub_categories'].length; subCategoryIndex++) {
        final subCategory = category['sub_categories'][subCategoryIndex];
        for(int itemIndex = 0 ; itemIndex < subCategory['items'].length; itemIndex++) {
          final item = subCategory['items'][itemIndex];
          listItems.add(Item(
            id: item['item_id'],
            category: categoryName.toString(),
            background: item['item_color'],
            name: item['item_name'],
            price: item['item_price'] + 0.0,
            image: item['item_image'],
            posterImage: item['item_poster_image'],
            reviewCount: item['item_review'] + 0.0,
            numberOfPieces: item['item_pieces'],
            stock: item['item_stock'],
          ));
        }

      }
    }
    return listItems;
  }
}

Future<void> retryOperation(Future<void> Function() operation, {int retryDelayInSeconds = 5}) async {
  try {
    await operation();
  } on SocketException catch (_) {
    await Future.delayed(Duration(seconds: retryDelayInSeconds));
    return retryOperation(operation, retryDelayInSeconds: retryDelayInSeconds);
  }
}