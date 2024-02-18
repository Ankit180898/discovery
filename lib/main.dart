import 'package:discovery/Services/api_service.dart'; // Import ApiService
import 'package:discovery/dependency_injection.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'Controllers/internet_controller.dart';
import 'Views/home_screen.dart';
void main() {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
