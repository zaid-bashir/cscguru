import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustumLoader extends StatelessWidget {
  const CustumLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GFLoader(
      type: GFLoaderType.square,
      size: 50,
    );
  }
}
