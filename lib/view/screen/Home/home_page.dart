import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../controller/home/home_controller.dart';

import '../../widgets/Home/home_page/best_category_screen.dart';
import '../../widgets/Home/home_page/best_product.dart';
import '../../widgets/Home/home_page/most_popular.dart';
import '../../widgets/Home/home_page/recommended_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required HomeController controller,
    required this.listClick,
  }) : _controller = controller;

  final HomeController _controller;
  final void Function(GlobalKey<State<StatefulWidget>>) listClick;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: BestCategorySection(controller: _controller)),
          SliverList(
              delegate: SliverChildListDelegate(
                  [
                    RecommendedSection(
                      homeController: _controller,
                    ),
                    const SizedBox(height: 30),
                    BestProductSection(
                      controller: _controller,
                      listClick: listClick,
                    ),
                    const SizedBox(height: 50),
                    MostPopularCategory(
                      controller: _controller,
                      listClick: listClick,
                    ),
                    const SizedBox(height: 80)
                  ]
              ))
        ],
      );
  }
}