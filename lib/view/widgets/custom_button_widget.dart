import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.child,
    this.onPressed,
  });
  final Widget? child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.primary.withOpacity(0.1)),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 15, horizontal: 30))),
      child: child,
    );
  }
}
