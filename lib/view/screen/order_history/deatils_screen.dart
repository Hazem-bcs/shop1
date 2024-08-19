import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/my_app_bar.dart';
import '../../../data/model/item.dart';

import '../../widgets/item_details_widget.dart';
import '../../widgets/order/carta/cart_text_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> listItem = Get.arguments[0];
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: MyAppBar(
            title: Text("Belling"),
          )),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return CartTextSection(
              numberOfItems: listItem.length,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: const Icon(Icons.list_alt)),
            );
          }
          if (index == listItem.length + 1) {
            return const SizedBox(height: 40);
          }
          return ItemDetailsWidget(
            item: listItem[index - 1],
            withSizedBox: true,
          );
        },
        itemCount: listItem.length + 2,
      ), // plus 2 for TextSection() and SizedBox in the last of the ListView
    );
  }
}
