import 'package:flutter/material.dart';

class CartTextSection extends StatelessWidget {
  const CartTextSection({
    super.key,this.child, required this.numberOfItems,
  });
  final Widget? child;
  final int numberOfItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 20),
            Text(
              "$numberOfItems Items in the Order",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                  color:
                  Theme.of(context).colorScheme.primary.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(50)),
              child: child,
            )
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}