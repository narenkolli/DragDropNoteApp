import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showToast(
      {String? message,
      Color color = Colors.blueAccent,
      int duration = 3,
      bool isError = false}) {
    Get.snackbar(isError ? "Error" : "Success", message ?? "",
        colorText: Colors.white,
        backgroundColor: color,
        maxWidth: 500,
        borderRadius: 30,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.only(top: 20),
        icon: Icon(
          isError ? Icons.error : Icons.done,
          color: Colors.white,
        ));
  }
}
