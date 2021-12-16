// ignore_for_file: prefer_const_constructors, unnecessary_const, deprecated_member_use

import 'package:cscguru/services/ApiServices/otp_api_service.dart';
import 'package:cscguru/views/pages/screens/authPages/otp_verify_page.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class LoginOTPPage extends StatefulWidget {
  const LoginOTPPage({Key key}) : super(key: key);

  @override
  _LoginOTPPageState createState() => _LoginOTPPageState();
}

class _LoginOTPPageState extends State<LoginOTPPage> {
  var formKey = GlobalKey<FormState>();
  var mobileController = TextEditingController();
  String mobileNo = "";
  bool isAPICallProcess = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          key: UniqueKey(),
          child: loginUI(),
          inAsyncCall: isAPICallProcess,
          opacity: .3,
        ),
      ),
    );
  }

  loginUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://i.imgur.com/bOCEVJg.png",
          height: 180,
          fit: BoxFit.contain,
        ),
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: const Center(
            child: Text(
              "Login With a Mobile Number",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Enter Your Mobile Number We Will Send You OTP To Verify",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 47,
                  width: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 3, 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: Center(
                    child: Text(
                      "+91",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: mobileController,
                    maxLines: 1,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Enter Your Mobile Number",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Mobile Number can not be empty";
                      }
                      if (value.length < 10) {
                        return "Please enter 10 digits Mobile Number";
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        FormHelper.submitButton(
          "Get OTP",
          () {
            if (formKey.currentState.validate()) {
              setState(() {
                isAPICallProcess = true;
              });
              OTPAPIService.otpLogin(mobileController.text)
                  .then((response) async {
                setState(() {
                  isAPICallProcess = false;
                });
                debugPrint(response.data);
                debugPrint(response.message);
                if (response.data != null) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPVerifyPage(
                          otpHash: response.data,
                          mobileNo: mobileNo,
                        ),
                      ),
                      (route) => false);
                }
              });
            }
          },
          borderColor: HexColor("#78D0B1"),
          btnColor: HexColor("#78D0B1"),
          txtColor: HexColor("#000000"),
          borderRadius: 20,
        )
      ],
    );
  }
}
