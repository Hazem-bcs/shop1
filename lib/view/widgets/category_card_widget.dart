import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/core/constant/routes.dart';
import 'package:shop/core/function/getImageFromDrive.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.categoryId,
  });

  final String image;
  final String title;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.subCategoryScreen, arguments: [categoryId]);
      },
      child: Column(
        children: [
          Container(
            width: 142,
            height: 142,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.85),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: getImageFromDrive(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
