import 'dart:developer';

import 'package:blood_pressure/src/core/network/network_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckNetwork {
  final NetworkController _networkController = Get.put(NetworkController());
  late final BuildContext context;
  checkInternetConnection() {
    if (_networkController.connectionType.value ==  "No Internet Connection") {
   
      Get.defaultDialog(
          title: "thông báo",
          content:
              Text('Check lại internet'));
    }
  }
}
