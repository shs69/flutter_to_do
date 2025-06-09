import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/screens/welcome_screen.dart';
import 'package:to_do_app/data/controllers/task_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskController()),
        // можно добавить другие провайдеры
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    ),
  );
}
