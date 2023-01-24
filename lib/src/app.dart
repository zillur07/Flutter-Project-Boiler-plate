import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_project/src/view/pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
