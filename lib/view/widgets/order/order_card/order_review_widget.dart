import 'package:flutter/material.dart';

class OrderCartReviewWidget extends StatelessWidget {
  const OrderCartReviewWidget({
    super.key,
    required this.review,
  });

  final double review;

  @override
  Widget build(BuildContext context) {
    return Text(
      "⭐ ($review reviews)",
      style: const TextStyle(fontSize: 15, color: Colors.grey),
    );
  }
}