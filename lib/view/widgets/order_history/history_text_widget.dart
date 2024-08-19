import 'package:flutter/material.dart';


class HistoryTextWidget extends StatelessWidget {
  const HistoryTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Text("Order History",
              style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
