import 'dart:developer';

import 'package:chat_time/screen/chartlist_screen.dart';
import 'package:chat_time/screen/login_screen.dart';
import 'package:chat_time/screen/message_screen.dart';
import 'package:chat_time/screen/registration_screen.dart';
import 'package:chat_time/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'network/auth/user_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var initialRoute = "";

  @override
  Widget build(BuildContext context) {
    if (getUserState()) {
      initialRoute = ApplicationRoute.chartlistRoute;
    } else {
      initialRoute = ApplicationRoute.loginRoute;
    }

    log("ROUTE: $initialRoute");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialRoute: initialRoute,
      routes: {
        // ignore: prefer_const_constructors
        ApplicationRoute.registrationRoute: (context) => RegistratioPage(),
        ApplicationRoute.chartlistRoute: (context) => const ChatListPage(),
        ApplicationRoute.loginRoute: (context) => const LoginPage(),
        ApplicationRoute.messageDetailRoute: (context) => const MessagePage()
      },
    );
  }
}
