import 'package:flutter/material.dart';


class WidgetHorizontalListView extends StatelessWidget {
  const WidgetHorizontalListView({super.key, required this.itemCount, required this.itemBuilder, required this.height});
  final int itemCount;
  final double height;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(width: 20),
          ),
          SliverList.separated(
            itemBuilder: itemBuilder,
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemCount:  itemCount,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(width: 20),
          ),
        ],
      ),
    );
  }
}
