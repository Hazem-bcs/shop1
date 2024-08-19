import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/my_location_controller.dart';
import '../../../data/model/location.dart';
import '../Global_Widget/text_paragraph_field_fidget.dart';

class AddLocations extends StatelessWidget {
  AddLocations({
    super.key,
    this.isUpdateMode = false,
    this.index,
  });
  final MyLocationController controller = Get.find();
  final GlobalKey<FormState> formState = GlobalKey();
  final bool isUpdateMode;
  final int? index;
  @override
  Widget build(BuildContext context) {
    String? subTitle;
    String? title;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.12, vertical: size.height * 0.06),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formState,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const Text("Enter your Name of Location"),
                  const SizedBox(height: 10),
                  TextParagraphField(
                    initialValue: isUpdateMode
                        ? controller.myLocationsList[index!].title
                        : null,
                    onSaved: (value) {
                      title = value;
                    },
                    maxLines: 3,
                    minLines: 1,
                    maxLength: 50,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field shouldn't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text("Enter your Location"),
                  const SizedBox(height: 10),
                  TextParagraphField(
                    initialValue: isUpdateMode
                        ? controller.myLocationsList[index!].location
                        : null,
                    onSaved: (value) {
                      subTitle = value;
                    },
                    maxLines: 10,
                    minLines: 4,
                    maxLength: 110,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field shouldn't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              formState.currentState!.save();
                              if (isUpdateMode) {
                                controller.myLocationsList[index!].locationId;
                                controller.updateElement(
                                    MyLocation(
                                        locationId: controller
                                            .myLocationsList[index!].locationId,
                                        title: title!,
                                        location: subTitle!),
                                    index!);
                              } else {
                                controller.addElement(MyLocation(
                                    title: title!, location: subTitle!));
                              }
                              Get.back();
                            }
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
