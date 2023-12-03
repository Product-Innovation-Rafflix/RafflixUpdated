// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:rafflix/theme.dart';
import 'package:rafflix/utils/TextField.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Updated key type
  bool passenable = true;
  bool validate = false;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Column(
                  children: [
                    Gap(10.h),
                    Text(
                      'Create new account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.r,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      'Please fill in the form to continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.r,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(95.w, -30.h),
                child: SizedBox(
                  width: 300.w,
                  height: 300.h,
                  child: Image.asset("assets/images/signup.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox(
                  height: 400.h,
                  width: 300.w,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        InputTextField(
                            'Enter your username',
                            'Username',
                            const Icon(Icons.person_2_outlined),
                            'username',
                            nameController),
                        SizedBox(height: 15.h),
                        InputTextField(
                            'Enter your phone',
                            'Phone',
                            const Icon(Icons.call_outlined),
                            'phone',
                            phoneController),
                        SizedBox(height: 15.h),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$')
                                    .hasMatch(value)) {
                              return "Enter a valid password (at least 8 characters with uppercase, lowercase, and digits).";
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: passenable,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(width: 1),
                            ),
                            hintText: 'Enter Your Password',
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  // Use setState to trigger a rebuild
                                  passenable = !passenable;
                                });
                              },
                              icon: Icon((passenable == true)
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.r,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/needHelp');
                            },
                            child: Text(
                              'Need Help?',
                              style: TextStyle(
                                fontSize: 12.r,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                color: primaryRed,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 27.h),
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                validate = true;
                                const snackBar =
                                    SnackBar(content: Text('Sign Up'));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBar); // Use ScaffoldMessenger
                              }
                              if (validate) {
                                CreateAccount(
                                    context,
                                    nameController.text,
                                    phoneController.text,
                                    passwordController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 12.0,
                              backgroundColor: primaryRed,
                            ),
                            child: const Text('Sign Up',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/signin');
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 12.r,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter',
                                    color: primaryRed,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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

CreateAccount(
    BuildContext context, String name, String phone, String password) async {
  var url = "https://rafflixbackgroundsevice.onrender.com/api/signup";
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{'name': name, 'phone': phone, 'password': password},
    ),
  );

  if (response.statusCode == 200) {
    // Parse the JSON response if needed
    Map<String, dynamic> responseData = jsonDecode(response.body);
    print(responseData);

    // Show a success message to the user
    final snackBar = SnackBar(content: Text('Sign Up Successful'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Direct the user to the login screen
    Navigator.pushNamed(context, '/signin');
  } else {
    // If the server did not return a 200 OK response,
    // show an error message to the user
    final snackBar = SnackBar(content: Text('Failed to create account'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // If needed, you can log the error details
    print('Failed to create account. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
