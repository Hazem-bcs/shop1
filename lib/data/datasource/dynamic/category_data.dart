
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/category.dart';

class CategoryData {
  final supabase = Supabase.instance.client;
  Future<List<Category>> getListCategory() async {
    final response = await supabase.from('categories').select('*');
    if (response.isEmpty) {
      return [];
    } else {
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
  }
}