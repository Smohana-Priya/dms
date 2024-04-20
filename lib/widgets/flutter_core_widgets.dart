import 'dart:async';
import 'package:flutter/material.dart';

/// Base class of the CoreWidget's stateful widget class
abstract class CoreWidgets extends StatefulWidget {
  const CoreWidgets({Key? key}) : super(key: key);
}

class CoreWidgetsState<T> extends State<CoreWidgets> {
  //Sample or Example values
  bool updating = false;
  bool isProgress = false;
  dynamic singletonInstance;
  BuildContext? buildContext;
  BuildContext? dialogContext;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _update() async {
    setState(() {
      updating = false;
    });
  }

  void update() {
    setState(() {
      updating = true;
    });
    _update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Get the settings panel content.
  Widget? buildSettings(BuildContext context) {
    return null;
  }

  void showInSnackBar({String value = 'Error'}) {
    // _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(value)));
  }

  // Future<void> toCheckInternetConnection() async {
  //   await Connectivity().checkConnectivity().then((ConnectivityResult result) {
  //     if (result.name == 'none') {
  //       AppUtils.showToast('No Internet');
  //       // showLoaderDialog(isDismiss: false);
  //     } else {}
  //   });
  //   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
  //     if (result.name == 'none') {
  //       AppUtils.showToast('No Internet');
  //       // showLoaderDialog(isDismiss: false);
  //     } else {}
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return const SizedBox();
  }
}
