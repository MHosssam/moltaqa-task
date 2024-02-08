import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class Constants {
  static void showErrorDialog({
    required BuildContext context,
    required String msg,
  }) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          msg,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black, textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? position,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: color ?? AppColors.main,
      toastLength: Toast.LENGTH_LONG,
      gravity: position ?? ToastGravity.BOTTOM,
    );
  }
}
