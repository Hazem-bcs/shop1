import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/datasource/dynamic/location_data.dart';
import '../../data/model/location.dart';
import '../../view/setting/LocationCardWidget.dart';

class MyLocationController extends GetxController {
  final LocationsData _repository = LocationsData();
  RxBool isLoading = true.obs;
  bool isLoadingSubmit = false;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  late MyLocation selectedLocation;
  final List<MyLocation> myLocationsList = [];
  Future<void> removeElement(int index) async {
    final int locationId = myLocationsList[index].locationId!;
    myLocationsList.removeAt(index);
    listKey.currentState?.removeItem(
      index + 1,
      (context, animation) => buildRemovedItem(index + 1, context, animation),
    );
    await _repository.deleteLocation(userId: 1, locationId: locationId);
    update();
  }

  Future<void> addElement(MyLocation location) async {
    int insertIndex = myLocationsList.length;
    myLocationsList.add(location);
    selectedLocation = location;
    listKey.currentState?.insertItem(insertIndex + 1);
    update();
    final response = await _repository.insertLocation(location, 1);
    if (myLocationsList[insertIndex] != null) {
      myLocationsList[insertIndex].locationId = response;
    }
  }

  Future<void> updateElement(MyLocation location, int index) async {
    myLocationsList[index].title = location.title;
    myLocationsList[index].location = location.location;
    update();
    await _repository.updateOnLocation(location, 1);
  }

  void setSelectedLocation(MyLocation location) {
    selectedLocation = location;
    update();
  }

  void setInitialLocation() {
    if (myLocationsList.isEmpty) {
      selectedLocation = MyLocation(title: "", location: "");
    } else {
      selectedLocation = myLocationsList.first;
    }
  }

  Future<void> getLocationList(int userId) async {
    try {
      isLoading.value = true;
      final List<MyLocation> locationList =
          await _repository.getLocationList(userId);
      myLocationsList.assignAll(locationList);
    } finally {
      isLoading.value = false;
    }
  }

  void updateIsLoadingSubmit(bool value) {
    isLoadingSubmit = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    setInitialLocation();
    getLocationList(1);
  }

  // Build the widget for the removed item
  Widget buildRemovedItem(
      int index, BuildContext context, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: LocationCardWidget(
        size: MediaQuery.of(context).size,
        title: "--------",
        subTitle: '===========================',
        numberInList: index.toString(),
      ),
    );
  }
}
