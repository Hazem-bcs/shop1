import 'package:flutter/material.dart';

class OrderButtonCardWidget extends StatelessWidget {
  const OrderButtonCardWidget({
    super.key,
    this.border = false,
    this.colorInBackGround = false,
    required this.child, this.onPressed,
  });

  final bool? border;
  final bool? colorInBackGround;
  final Text child;
  final  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: colorInBackGround!
          ? Theme.of(context).colorScheme.primary.withOpacity(0.4)
          : Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: border!
              ? const BorderSide(width: 2, color: Colors.grey)
              : const BorderSide()),
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      onPressed: onPressed,
      child: child,
    );
  }
}