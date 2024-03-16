import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/pet_controller.dart';
import 'package:pet_adoption/firebase_options.dart';
import 'package:pet_adoption/screens/login/auth_page.dart';
import 'package:pet_adoption/screens/login/login.dart';
import 'package:pet_adoption/screens/root_app.dart';
import 'package:pet_adoption/storage/app_shared.dart';
import 'package:pet_adoption/theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppShared.init();
  Get.put(PetController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      home: AuthPage(),
    );
  }
}
