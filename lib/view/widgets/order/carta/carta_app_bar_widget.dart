import 'package:flutter/material.dart';

import '../../../../core/my_app_bar.dart';
import 'AppBarCartaWidget.dart';
import 'cart_price_widget.dart';

class CartaAppBarWidget extends StatelessWidget {
  const CartaAppBarWidget({
    super.key,
    required this.userId,
  });
  final int userId;
  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Column(
            children: [
              AppBarSection(
                userId: userId,
              ),
              const SizedBox(
                height: 10,
              ),
              const CartaPriceWidget()
            ],
          )),
    );
  }
}
