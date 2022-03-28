import 'package:cat_facts_app/routes/app_pages.dart';
import 'package:cat_facts_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/initial_bindings.dart';

 void main() async {
  await InitialBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
      home: Home(),
      //initialRoute: AppPages.home,
    );
  }
}