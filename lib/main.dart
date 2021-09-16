import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_app/photo_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Photo App',
      theme: ThemeData(primaryColor: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: PhotoListView(),
    );
  }
}
