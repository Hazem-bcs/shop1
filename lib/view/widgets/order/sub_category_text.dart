import 'package:flutter/material.dart';
class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,
                top: 15,
                bottom: 10),
                child: Text("${title[0].toUpperCase() + title.substring(1)}:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 21)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}