import 'dart:io';
import 'package:ecomurse/admin/home_admin.dart';
import 'package:ecomurse/pages/app_constant.dart';
import 'package:ecomurse/pages/onboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'admin/admin_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=Publishablekey;
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCl02hiuBACgdMz0aWIvWwfl4fGhC6Bs7c",
        appId: "1:1059019672826:android:362ac43d8c2812f0770d43",
        messagingSenderId: "1059019672826",
        projectId: "fooddeliveryapp-7719d",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:AdminLogin(), // Your initial screen
    );
  }
}
