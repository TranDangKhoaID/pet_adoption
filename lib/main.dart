import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption/firebase_options.dart';
import 'package:pet_adoption/screens/root_app.dart';
import 'package:pet_adoption/theme/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      home: const RootApp(),
    );
  }
}
