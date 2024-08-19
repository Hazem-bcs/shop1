import 'package:flutter/material.dart';


class WidgetTextHome extends StatelessWidget {
  const WidgetTextHome({super.key, required this.title, this.onPressedOnViewAll,this.showAll  = true});
  final String title;
  final void Function()? onPressedOnViewAll;
  final bool? showAll;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if(showAll!) ...[
            TextButton(
              onPressed: onPressedOnViewAll,
              child: Text("View all",style: Theme.of(context)
                  .textTheme
                  .labelMedium,),
            ),
          ]
        ],
      ),
    );
  }
}
