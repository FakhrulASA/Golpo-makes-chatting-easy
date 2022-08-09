import 'package:chat_time/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../network/auth/auth.dart';
import '../util/ProgressUtil.dart';

class RegistratioPage extends StatefulWidget {
  const RegistratioPage({Key? key}) : super(key: key);

  @override
  State<RegistratioPage> createState() => _RegistratioPageState();
}

class _RegistratioPageState extends State<RegistratioPage> {
  final _formKey = GlobalKey<FormState>();
  var h1 = 50;
  var h2 = 50;
  var h3 = 50;
  var email = "";
  var password1 = "";
  var password2 = "";
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
                    "Welcome to Chat Time,\nRegister now, ",
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
                          context, ApplicationRoute.loginRoute);
                    },
                    child: const Text(
                      "Already have an account?, LOGIN",
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
                          hintText: "Please enter your email",
                          border: InputBorder.none,
                          contentPadding: EdgeInsetsGeometry.lerp(
                              const EdgeInsets.all(10),
                              const EdgeInsets.all(10),
                              0.0)),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          h1 = 80;
                          setState(() {});
                          return "Email cannot be empty";
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
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: h1.toDouble(),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 217, 147),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Please enter your name",
                          border: InputBorder.none,
                          contentPadding: EdgeInsetsGeometry.lerp(
                              const EdgeInsets.all(10),
                              const EdgeInsets.all(10),
                              0.0)),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          h1 = 80;
                          setState(() {});
                          return "Name cannot be empty";
                        } else if (value.length < 2) {
                          h1 = 80;
                          setState(() {});
                          return "Please enter valid Name";
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
                    onChanged: (value) {
                      password1 = value.toString();
                      setState(() {});
                    },
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
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: h3.toDouble(),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Please re-enter your password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsetsGeometry.lerp(
                          const EdgeInsets.all(10),
                          const EdgeInsets.all(10),
                          0.0),
                    ),
                    onChanged: (value) {
                      password2 = value.toString();
                      setState(() {});
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        h3 = 80;
                        setState(() {});
                        return "Password cannot be empty";
                      } else if (value.length < 2) {
                        h3 = 80;
                        setState(() {});
                        return "Please enter valid Password";
                      } else if (password1 != password2) {
                        h3 = 80;
                        setState(() {});
                        return "Entered password does not match!";
                      } else {
                        h3 = 50;
                        setState(() {});
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () {
                    final isvalid = _formKey.currentState!.validate();
                    if (isvalid) {
                      showLoaderDialog(
                          context, "Registering you, please wait!");
                      _formKey.currentState!.save();
                      registerUserWithEmailAndPassword(email, password1)
                          .then((value) {
                        if (value.success) {
                          Fluttertoast.showToast(msg: value.message);
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, ApplicationRoute.loginRoute);
                        } else {
                          Fluttertoast.showToast(msg: value.message);
                          Navigator.pop(context);
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
                        "Register",
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
