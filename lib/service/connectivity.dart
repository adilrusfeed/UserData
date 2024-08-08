import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:user_data/widgets/error_data.dart';

class InternetService {
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}

//--------------internet alert ------------------------

class NoInternetAlertDialog extends StatelessWidget {
  final VoidCallback onOkPressed;

  const NoInternetAlertDialog({required this.onOkPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorDisplay();
  }
}
