import 'package:flutter/material.dart';

import '../Home/horizintal_list_view_widget.dart';


class ShimmerItemWidget extends StatelessWidget {
  const ShimmerItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetHorizontalListView(itemCount: 6,
        itemBuilder: (_, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0),
                height: 120,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: const BoxDecoration(
                  color: Colors.grey, // backGroundColor
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(300),
                    topRight: Radius.circular(300),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 120,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ],
          );
        },
        height: 290);
  }
}