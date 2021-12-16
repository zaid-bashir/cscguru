// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cscguru/services/ApiServices/otp_api_service.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class OTPVerifyPage extends StatefulWidget {
  OTPVerifyPage({Key key, this.mobileNo, this.otpHash}) : super(key: key);

  final String mobileNo;
  final String otpHash;

  @override
  _OTPVerifyPageState createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  String otpCode = "";
  final int otpCodeLength = 4;
  bool isAPICallProcess = false;
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
    SmsAutoFill().listenForCode.call();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          key: UniqueKey(),
          child: verifyOTPUI(),
          inAsyncCall: isAPICallProcess,
          opacity: .3,
        ),
      ),
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }

  verifyOTPUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://i.imgur.com/6aiRpKT.png",
          height: 180,
          fit: BoxFit.contain,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "OTP Verification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Enter OTP Code Sent To Your Mobile Number \n+91-${widget.mobileNo}",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: PinFieldAutoFill(
            decoration: UnderlineDecoration(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              colorBuilder: FixedColorBuilder(
                Colors.black.withOpacity(.3),
              ),
            ),
            currentCode: otpCode,
            codeLength: otpCodeLength,
            onCodeChanged: (code) {
              if (code.length == otpCodeLength) {
                otpCode = code;
                FocusScope.of(context).requestFocus(
                  FocusNode(),
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FormHelper.submitButton(
          "Verify OTP",
          () {
            setState(() {
              isAPICallProcess = true;
            });
            OTPAPIService.verifyOTP(widget.mobileNo, widget.otpHash, otpCode)
                .then((response) async {
              setState(() {
                isAPICallProcess = false;
              });
              debugPrint(response.data);
              debugPrint(response.message);
              if (response.data != null) {
                FormHelper.showSimpleAlertDialog(
                    context, "CSCGuru", response.message, "OK", () {
                  Navigator.pop(context);
                });
              } else {
                FormHelper.showSimpleAlertDialog(
                    context, "CSCGuru", response.message, "Invalid OTP", () {
                  Navigator.pop(context);
                });
              }
            });
          },

          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => OTPVerifyPage(),
          //   ),
          // );
          borderColor: HexColor("#78D0B1"),
          btnColor: HexColor("#78D0B1"),
          txtColor: HexColor("#000000"),
          borderRadius: 20,
        )
      ],
    );
  }
}
