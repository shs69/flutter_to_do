import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/screens/welcome_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ),
  );
}
