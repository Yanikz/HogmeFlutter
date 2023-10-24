import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hogme_flutter_application/screens/announcement/announcement.dart';
import 'package:hogme_flutter_application/screens/home.dart';
import 'package:hogme_flutter_application/screens/login.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //storing the user token into the box variable
    final box = GetStorage();
    //fetching the user token
    final token = box.read('token');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOGME',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: token == null ? const Login() : const Home(),
    );
  }
}
