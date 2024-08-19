import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/sub_category_controller.dart';
import '../../../view/widgets/order/order_card/carta_widget.dart';
import '../../my_app_bar.dart';

PreferredSize buildSubCategoryAppBar(
    BuildContext context, SubCategoryController controller) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(120),
    child: MyAppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: SizedBox(
          height: 50,
          child: Obx(
            () => controller.isLoading.value
                ? Container()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller.changeFromController = true;
                        controller.subCategoryScreen = index;
                      },
                      child: GetBuilder<SubCategoryController>(
                        builder: (controller) => SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: AnimatedContainer(
                            padding: const EdgeInsets.only(bottom: 15, top: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 3,
                                  color: controller.subCategoryScreen == index
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.transparent),
                            )),
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              controller
                                  .listSubCategoryItems[index].categoryName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      letterSpacing: 1.6,
                                      fontSize: 16,
                                      color:
                                          controller.subCategoryScreen == index
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : null),
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemCount: controller.listSubCategoryItems.length,
                  ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: CartaWidget(
            key: controller.cartKey,
          ),
        ),
      ],
      elevation: 2,
    ),
  );
}
