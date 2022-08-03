import 'package:chat_time/util/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormFieldState> formFieldKey = GlobalKey();
  loginUser() {}
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
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
                    Navigator.pushNamed(
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
                  height: 50,
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
                        return "Username cannot be empty";
                      } else if (value.length < 2) {
                        return "Please enter valid username";
                      }
                      return null;
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (value.length < 2) {
                      return "Please enter valid Password";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("Forgot password?  ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w200)),
                  Text(
                    "RESET",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              InkWell(
                onTap: () {
                  formFieldKey.currentState!.validate();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 148, 31, 31),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
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
        )),
      ),
    );
  }
}
