import 'package:flutter/material.dart';

import '../../../data/model/custom_icon.dart';
import '../Global_Widget/animation_svg_widget.dart';

class CustomIconWidget extends StatelessWidget {
  final CustomIcon customIcon;
  final bool isToggled;

  const CustomIconWidget({
    super.key,
    required this.customIcon,
    required this.isToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimationSvgWidget(
          isIt: customIcon.image,
          isNot: customIcon.imageClick,
          isToggled: isToggled,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          customIcon.head,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 157, 157, 157),
          ),
        ),
      ],
    );
  }
}
