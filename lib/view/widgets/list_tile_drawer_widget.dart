import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListTileDrawerWidget extends StatelessWidget {
  const ListTileDrawerWidget({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final String icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          trailing: SizedBox(
            height: 26,
            width: 26,
            child: SvgPicture.asset(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          title: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
