import 'dart:convert';

OTPLoginResponseModel otpLoginResponseJSON(String str) {
  return OTPLoginResponseModel.fromJson(json.decode(str));
}

class OTPLoginResponseModel {
  OTPLoginResponseModel({
    this.message,
    this.data,
  });
  String message;
  String data;

  OTPLoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }
}
