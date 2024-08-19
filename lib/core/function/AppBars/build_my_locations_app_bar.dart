import 'package:flutter/material.dart';

import '../../../view/widgets/order_history/add_location_widget.dart';
import '../../my_app_bar.dart';

MyAppBar buildMyLocationAppBar(BuildContext context) {
  return MyAppBar(
    title: Text(
      "My Locations",
      style: Theme.of(context).textTheme.labelLarge,
    ),
    actions: [
      IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddLocations();
              },
            );
          },
          icon: const Icon(Icons.add))
    ],
  );
}
