import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hogme_flutter_application/screens/register.dart';
import 'package:hogme_flutter_application/utils/colors/app_theme.dart';
import 'package:hogme_flutter_application/utils/widgets/text_widgets.dart';

import '../backend_connection/API/authentication_controller.dart';
import '../utils/widgets/button_shadow.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  late TextEditingController usernamecontroller;
  late TextEditingController passwordcontroller;
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo with text

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.00, right: 15.00),
                    child: Image.asset(
                      "assets/icons/icon_hogme.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  text50BoldHeading(text: 'HOGME'),
                ],
              ),

              //slogan - nurturing livestocks with innovation
              Padding(
                padding: const EdgeInsets.only(top: 10.00, bottom: 20.00),
                child: text16Bold(text: "Nurturing livestocks with innovation"),
              ),
              //email placeholder with icons
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: TextFormField(
                  controller: usernamecontroller,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    labelText: "Email Address",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
              ),
              //password with icons
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
              ),
              //forgot password = if makaya

              //login button
              // GestureDetector(
              //   onTap: () => {print("tapped")},
              //   child: Container(
              //     width: 325,
              //     height: 50,
              //     margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
              //     decoration: buttonShadow(themeColor: AppTheme.primaryButtons),
              //     child: Center(
              //       child:
              //           text16Bold(text: "Log in", defaultColor: Colors.white),
              //     ),
              //   ),
              // ),
              const Row(),
              //Create account button
              // GestureDetector(
              //   onTap: () => {},
              //   child: Container(
              //     width: 325,
              //     height: 50,
              //     margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
              //     decoration: buttonShadow(themeColor: Colors.white),
              //     child: Center(
              //       child:
              //           text16Bold(text: "Sign up", defaultColor: Colors.black),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 325, // <-- match_parent
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryButtons,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () async {
                    await _authenticationController.login(
                      email: usernamecontroller.text.trim(),
                      password: passwordcontroller.text.trim(),
                    );
                  },
                  child: Obx(() {
                    return _authenticationController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : text16Normal(
                            text: 'Login', defaultColor: Colors.white);
                  }),
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register()),
                  ),
                },
                child: Container(
                  width: 325,
                  height: 50,
                  margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
                  decoration: buttonShadow(themeColor: Colors.white),
                  child: Center(
                    child: text16Normal(
                        text: "Sign up", defaultColor: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
