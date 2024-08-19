import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderPhotoCardWidget extends StatelessWidget {
  const OrderPhotoCardWidget({
    super.key,
    required this.image,
    required this.color,
    this.width = 25, this.flex = 1,
  });

  final String image;
  final Color color;
  final double? width;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        width: width,
        height: 120,
        color: color,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}