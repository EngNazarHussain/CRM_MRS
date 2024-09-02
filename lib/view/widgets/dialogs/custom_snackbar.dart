import 'package:crm_mrs_app/model/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showCustomSnackBar(String message, {bool isError = true}) async {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    duration: Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: EdgeInsets.all(AppSize.s10),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}
