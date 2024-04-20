import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'color_resources.dart';


class AppUtils {
  static void showErrorToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor:ColorResource.colorE22C24,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showToast(String text,
      {ToastGravity gravity = ToastGravity.CENTER}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static void showBarMessage(context, String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showSnackBar(BuildContext context, String value) async {
    final snackbar = SnackBar(
      duration: const Duration(milliseconds: 300),
      width: 710,
      content: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: ColorResource.colorFFFFFF),
      ),
      backgroundColor: Colors.green,
      action: SnackBarAction(
        label: '',
        textColor: Colors.white,
        onPressed: () {},
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void showErrorSnackBar(BuildContext context, String value) async {
    final snackbar = SnackBar(
      duration: const Duration(milliseconds: 300),
      width: 710,
      content: Text(
        value,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: ColorResource.colorFFFFFF),
      ),
      backgroundColor: ColorResource.colorE22C24,
      action: SnackBarAction(
        label: '',
        textColor: Colors.white,
        onPressed: () {},
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

