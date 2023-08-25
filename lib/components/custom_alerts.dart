import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertemplate/widgets/big_text.dart';

void showErrorAlert(String? message, {bool isError = true, String title = "Error"}) {
  Get.closeCurrentSnackbar();
  Get.snackbar(title, message!,
  titleText: BigText(text:title, color:Colors.white, fw: FontWeight.w700,),
    messageText: Text(message, style: GoogleFonts.lato(textStyle: TextStyle(
      color: Colors.white
    )),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.black54,
    margin: const EdgeInsets.all(10.0)
  );
}

void showSuccessAlert(String message, {bool isError = true, String title = "Success"}) {
  Get.closeCurrentSnackbar();
  Get.snackbar(title, message,
      titleText: BigText(text:title, color:Colors.white),
      messageText: Text(message, style: GoogleFonts.lato(textStyle: TextStyle(
          color: Colors.white
      )),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      margin: const EdgeInsets.all(10.0),
  );
}