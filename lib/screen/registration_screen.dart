import 'package:chat_time/util/routes.dart';
import 'package:flutter/material.dart';

class RegistratioPage extends StatefulWidget {
  RegistratioPage({Key? key}) : super(key: key);

  @override
  State<RegistratioPage> createState() => _RegistratioPageState();
}

class _RegistratioPageState extends State<RegistratioPage> {
  final _formKey = GlobalKey<FormState>();
  var h1 = 50;
  var h2 = 50;
  var h3 = 50;
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
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 217, 147),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Please enter your username or email",
                          border: InputBorder.none,
                          contentPadding: EdgeInsetsGeometry.lerp(
                              EdgeInsets.all(10), EdgeInsets.all(10), 0.0)),
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
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: h2.toDouble(),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Please enter your password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsetsGeometry.lerp(
                          EdgeInsets.all(10), EdgeInsets.all(10), 0.0),
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
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Please re-enter your password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsetsGeometry.lerp(
                          EdgeInsets.all(10), EdgeInsets.all(10), 0.0),
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
                      _formKey.currentState!.save();
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 148, 31, 31),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
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
