import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  final RxBool _isConnected = true.obs;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool get isConnected => _isConnected.value;

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> checkInternetConnection() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      updateInternetStatus(connectivityResult);
      _connectivitySubscription = Connectivity().onConnectivityChanged.listen(updateInternetStatus);
    } on PlatformException catch (e) {
      print('Error checking internet connection: $e');
    }
  }

  void updateInternetStatus(ConnectivityResult connectivityResult) {
    _isConnected.value = connectivityResult != ConnectivityResult.none;
  }
}
