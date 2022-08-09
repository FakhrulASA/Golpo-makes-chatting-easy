import 'dart:developer';

import 'package:chat_time/block/auth_bloc.dart';
import 'package:chat_time/event/auth_event.dart';
import 'package:chat_time/model/NetworkRequestModel.dart';
import 'package:chat_time/screen/chartlist_screen.dart';
import 'package:chat_time/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/user.dart';
import '../network/auth/auth.dart';
import '../util/ProgressUtil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var h1 = 50;
  var h2 = 50;
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset("assets/login.png",
                      height: 70, fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome back,\nLogin now ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, ApplicationRoute.registrationRoute);
                    },
                    child: const Text(
                      "If you are new, CREATE ACCOUNT",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    height: h1.toDouble(),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 217, 147),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Please enter your username or email",
                          border: InputBorder.none,
                          contentPadding: EdgeInsetsGeometry.lerp(
                              const EdgeInsets.all(10),
                              const EdgeInsets.all(10),
                              0.0)),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          h1 = 80;
                          setState(() {});
                          return "Username cannot be empty";
                        } else if (value.length < 2) {
                          h1 = 80;
                          setState(() {});
                          return "Please enter valid username";
                        } else {
                          h1 = 50;
                          setState(() {});
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: h2.toDouble(),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Please enter your password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsetsGeometry.lerp(
                          const EdgeInsets.all(10),
                          const EdgeInsets.all(10),
                          0.0),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        h2 = 80;
                        setState(() {});
                        return "Password cannot be empty";
                      } else if (value.length < 2) {
                        h2 = 80;
                        setState(() {});
                        return "Please enter valid Password";
                      } else {
                        h2 = 50;
                        setState(() {});
                      }
                      return null;
                    },
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Text("Forgot password?  ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w200)),
                    Text(
                      "RESET",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () {
                    final isvalid = _formKey.currentState!.validate();
                    if (isvalid) {
                      showLoaderDialog(context, "Login in, please wait!");
                      _formKey.currentState!.save();
                      final authBloc = AuthBloc(
                          null,
                          AppUser(
                              userName: email.split("@")[0],
                              password: password,
                              email: email));
                      authBloc.authEventSink.add(AuthEvent.login);
                      authBloc.authStream.listen((event) {
                        if (event.success) {
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) =>
                                  const ChatListPage(),
                            ),
                            (route) =>
                                false, //if you want to disable back feature set to false
                          );
                        } else {
                          Fluttertoast.showToast(msg: event.message);
                          Navigator.pop(context);
                          log("FAIL NNNNNNNNNNNNNNNN");
                        }
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 148, 31, 31),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
