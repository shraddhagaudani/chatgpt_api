import 'package:chatgpt_api/views/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/chatscreen',
      debugShowCheckedModeBanner: false,
      getPages: [GetPage(name: '/chatscreen', page: () => ChatScreen())],
    ),
  );
}
