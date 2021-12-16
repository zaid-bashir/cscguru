import 'dart:convert';

import 'package:cscguru/consts/apiurls.dart';
import 'package:cscguru/models/otp_login_response_model.dart';
import 'package:http/http.dart' as http;

class OTPAPIService {
  static var client = http.Client();
  static Future<OTPLoginResponseModel> otpLogin(String mobileNo) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(ApiUrls.kbaseUrl, ApiUrls.kotpLogin);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone": mobileNo}),
    );
    return otpLoginResponseJSON(response.body);
  }

  static Future<OTPLoginResponseModel> verifyOTP(
      String mobileNo, String otpHash, String otpCode) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(ApiUrls.kbaseUrl, ApiUrls.kverifyOTP);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "phone": mobileNo,
        "otp": otpCode,
        "hash": otpHash,
      }),
    );
    return otpLoginResponseJSON(response.body);
  }
}
