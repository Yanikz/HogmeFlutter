import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../backend_connection/API/authentication_controller.dart';
import '../utils/colors/app_theme.dart';
import '../utils/widgets/text_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController usernamecontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController firstnamecontroller;
  late TextEditingController lastnamecontroller;
  late TextEditingController contactnumbercontroller;
  File? validIdImage;
  File? facilityImage;

  List<XFile>? facilityImagesPath = [];

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  Future<void> _getImage(ImageSource source, Function(File) setImage) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    setImage(File(image.path));
  }

  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    firstnamecontroller = TextEditingController();
    lastnamecontroller = TextEditingController();
    contactnumbercontroller = TextEditingController();
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    contactnumbercontroller.dispose();

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
                  text50BoldHeading(text: 'Sign up'),
                ],
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: TextFormField(
                  controller: firstnamecontroller,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(
                      Icons.people,
                      color: Colors.black,
                    ),
                    labelText: "First Name",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: TextFormField(
                  controller: lastnamecontroller,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(
                      Icons.people,
                      color: Colors.black,
                    ),
                    labelText: "Last Name",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: TextFormField(
                  controller: contactnumbercontroller,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(
                      Icons.people,
                      color: Colors.black,
                    ),
                    labelText: "Contact number",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
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

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _getImage(ImageSource.gallery, (file) {
                    setState(() {
                      validIdImage = file;
                    });
                  });
                },
                child: const Text('Select Valid ID Image'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _getImage(ImageSource.gallery, (file) {
                    setState(() {
                      facilityImage = file;
                    });
                  });
                },
                child: const Text('Select Facility Image'),
              ),
              //forgot password = if makaya

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
                  await _authenticationController.register(
                    firstname: firstnamecontroller.text.trim(),
                    lastname: lastnamecontroller.text.trim(),
                    username: usernamecontroller.text.trim(),
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
                            text: 'Register', defaultColor: Colors.white);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
