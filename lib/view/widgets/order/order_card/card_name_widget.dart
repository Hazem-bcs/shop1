import 'package:flutter/material.dart';

class OrderCartNameWidget extends StatelessWidget {
  const OrderCartNameWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name, style: Theme.of(context).textTheme.displayMedium);
  }
}