class MyLocation {
  int? locationId;
  String title;
  String location;

  MyLocation({this.locationId,required this.title, required this.location});

  List<MyLocation> convertApiToModel(List<dynamic> apiResponse) {
    return apiResponse.map((map) {
      return MyLocation(
        locationId: map['location_id'] + 0,
        title: map['location_title'] as String,
        location: map['location_subtitle'] as String,
      );
    }).toList();
  }
}