import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/item.dart';
import '../../model/sub_category_product.dart';

class TestRepository {
  final supabase = Supabase.instance.client;

  Future<List<SubCategoryProduct>> getSubCategoryListItems(int categoryId) async {
    final response = await supabase
        .rpc("get_category_items" , params: { 'category_id_param' : 1});
    if(response.isEmpty) {
      return [];
    }
    else if (response.isNotEmpty){
      return _getSubCategoryListItems(response);
    }
    else {
      return [];
    }
  }

  List<SubCategoryProduct> _getSubCategoryListItems(List<dynamic> response) {
    final List<SubCategoryProduct> subCategoryProduct = [];
    for(int subCategoryIndex = 0 ; subCategoryIndex < response.length; subCategoryIndex++) {
      final subCategory = response[subCategoryIndex];
      final String categoryName = subCategory['category_name'];
      final itemsList = subCategory['items'];
      List<Item> listItem = (itemsList as List<dynamic>).cast<Map<String, dynamic>>().map((item) {
        return Item(
          id: item['item_id'],
          category: categoryName.toString(),
          background: item['item_color'],
          name: item['item_name'],
          price: item['item_price'] + 0.0,
          image: item['item_image'],
          reviewCount: item['item_review'] + 0.0,
          numberOfPieces: item['item_pieces'],
          stock: item['item_stock'],
        );
      }).toList();
      subCategoryProduct.add(
          SubCategoryProduct(categoryName: subCategory['sub_category_name'],
              listItem: listItem
          )
      );
    }
    return subCategoryProduct;
  }
}