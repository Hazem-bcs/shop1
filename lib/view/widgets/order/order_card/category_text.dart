import 'package:flutter/material.dart';

class OrderCardCategoryWidget extends StatelessWidget {
  const OrderCardCategoryWidget({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Text(category,
        style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: 10));
  }
}