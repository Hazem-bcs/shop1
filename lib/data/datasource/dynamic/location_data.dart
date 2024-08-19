import 'package:shop/data/model/location.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LocationsData {
  final supabase = Supabase.instance.client;
  final MyLocation locationData = MyLocation(title: "", location: "");

  Future<List<MyLocation>> getLocationList(int userId) async {
    final response = await supabase.rpc('get_locations', params: {
      'user_id_param': userId,
    });
    return locationData.convertApiToModel(response);
  }

  Future<void> deleteLocation({required int userId,required int locationId}) async {
    await supabase.rpc('delete_from_table_locations', params: {
      '_user_id': userId,
      '_location_id': locationId,
    });
  }

  Future<int> insertLocation(MyLocation location, int userId) async {
    final response = await supabase.rpc('insert_location_and_return_id', params: {
      '_user_id': userId,
      '_location_title': location.title,
      '_location_subtitle': location.location
    });
    return response;
  }
  Future<void> updateOnLocation(MyLocation location, int userId) async {
    await supabase.rpc('update_on_table_locations', params: {
      '_user_id': userId,
      '_location_id': location.locationId,
      '_new_title': location.title,
      '_new_subtitle': location.location
    });
  }
}