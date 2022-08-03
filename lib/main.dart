import 'package:chat_time/screen/chartlist_screen.dart';
import 'package:chat_time/screen/login_screen.dart';
import 'package:chat_time/screen/message_screen.dart';
import 'package:chat_time/screen/registration_screen.dart';
import 'package:chat_time/util/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialRoute: ApplicationRoute.loginRoute,
      routes: {
        ApplicationRoute.registrationRoute: (context) => RegistratioPage(),
        ApplicationRoute.chartlistRoute: (context) => ChatListPage(),
        ApplicationRoute.loginRoute: (context) => LoginPage(),
        ApplicationRoute.messageDetailRoute: (context) => MessagePage()
      },
    );
  }
}
