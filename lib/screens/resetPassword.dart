// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafflix/theme.dart';
import 'package:rafflix/utils/TextField.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  bool passenable = true;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.r,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    Text(
                      'Enter the email related with your account \nWe will send a message to reset your password ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.r,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Transform.translate(
                offset: const Offset(0, 0),
                child: SizedBox(
                  height: 266.h,
                  width: 291.w,
                  child: Image.network("https://via.placeholder.com/291x266"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: Form(
                    child: Column(
                      children: [
                        InputTextField(
                            'Enter your phone',
                            'Phone',
                            const Icon(Icons.phone_rounded),
                            'phone',
                            myController),
                        SizedBox(height: 15.h),
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 12.0,
                                backgroundColor: primaryRed),
                            child: const Text('Reset Password',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
