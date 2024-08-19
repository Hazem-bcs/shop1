import 'package:get/get.dart';

validator({required String val, required int min, required int max,required var type, String? rePasswordValue}) {
  if(type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "this is not valid value";
    }
  }
  if(type == "email") {
    if(!GetUtils.isEmail(val)) {
      return "this isn't valid email";
    }
  }
  if(type == "phone") {
      if (!GetUtils.isPhoneNumber(val)) {
        return "this is not a phone number";
      }
      else if(val.length < 10) {
        return "this short number";
      }
      else if(val.length > 12) {
        return "this largest number";
      }
    }
  if(type == "rePassword") {
    if (val != rePasswordValue) {
      return "The two values are not equal";
    }
  }
  if(val.isEmpty) {
    return "can't leave this field empty";
  }
  else if(val.length < 5) {
    return "this password so short";
  }

}