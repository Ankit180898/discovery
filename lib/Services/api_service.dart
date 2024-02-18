

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/internet_controller.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final InternetController _internetController = Get.find<InternetController>();

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    if(_internetController.isConnected){
      try {
        // Send HTTP GET request
        final response = await http.get(Uri.parse(url), headers: headers);

        // Check response status code
        if (response.statusCode == 200) {
          // Parse response body
          return json.decode(response.body);
        } else {
          // Handle API error (non-200 status code)
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      } catch (error) {
        // Handle other errors (e.g., network failure, parsing error)
        final message = 'Failed to load data: $error';
        throw Exception(message);
      }

    }
    else{
      Get.rawSnackbar(
        snackStyle: SnackStyle.GROUNDED,
        isDismissible: false,
        backgroundColor: Colors.red.withOpacity(0.6),
        messageText: const Text("Please connect to internet")
      );

    }

  }

}
