import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constant/routes.dart';
import 'package:shop/core/function/getImageFromDrive.dart';

import '../../../data/model/category.dart';

class CategoryHomeWidget extends StatelessWidget {
  const CategoryHomeWidget({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.subCategoryScreen,arguments: [category.categoryId]);
      },
      child: Column(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(getImageFromDrive(category.categoryImage)),
            ),
          ),
          const SizedBox(height: 4),
          Text(category.categoryName!,style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
