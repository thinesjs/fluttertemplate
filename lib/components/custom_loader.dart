import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:fluttertemplate/utils/dimensions.dart';


class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: Dimensions.height20*5,
          width: Dimensions.height20*5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height20*5/2),
            color: Colors.indigo
          ),
          alignment: Alignment.center,
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
