import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/login.png",
                  height: 100, fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                "Welcome back,\nLogin now ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                "If you are new, CREATE ACCOUNT",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
