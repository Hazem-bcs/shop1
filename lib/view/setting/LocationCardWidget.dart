import 'package:flutter/material.dart';

class LocationCardWidget extends StatelessWidget {
  const LocationCardWidget({
    super.key,
    required this.size,
    required this.title,
    required this.subTitle,
    required this.numberInList,
  });

  final Size size;
  final String title;
  final String subTitle;
  final String numberInList;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0XFF292929),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.069),
          title: Text(title),
          subtitle: Text(subTitle),
          leading: CircleAvatar(
            radius: 25,
            child: Text(
              numberInList,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
