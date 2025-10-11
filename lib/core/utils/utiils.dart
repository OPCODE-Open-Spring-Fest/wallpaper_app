
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showSuccessToast(BuildContext context, String content) {
  toastification.show(
    borderSide: BorderSide.none,
    context: context,
    applyBlurEffect: true,
    alignment: Alignment.bottomCenter,
    title: Text(content, style: const TextStyle(color: Colors.black54)),
    type: ToastificationType.success,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
    dragToClose: true,
    closeOnClick: false,
    dismissDirection: DismissDirection.down,
  );
}

void showFailiureToast(BuildContext context, String content) {
  toastification.show(
    borderSide: BorderSide.none,
    context: context,
    applyBlurEffect: true,
    alignment: Alignment.bottomCenter,
    title: Text(content, style: const TextStyle(color: Colors.black54)),
    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 5),
    // backgroundColor: ,
    dragToClose: true,
    closeOnClick: false,
    dismissDirection: DismissDirection.down,
  );
}
