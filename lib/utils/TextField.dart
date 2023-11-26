// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextFormField InputTextField(String hint, String label, Icon icon, String type,
    TextEditingController controller) {
  String? Function(String?)? validator;

  TextInputType keyboardType = TextInputType.text;

  if (type == 'phone') {
    validator = (value) {
      if (value!.isEmpty || !RegExp(r'^09\d{7,9}$').hasMatch(value)) {
        return "Invalid phone number";
      } else {
        return null;
      }
    };

    keyboardType = TextInputType.phone;
  } else if (type == 'username') {
    validator = (value) {
      if (value!.isEmpty || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
        return "Invalid Name";
      } else {
        return null;
      }
    };
  }

  return TextFormField(
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    inputFormatters:
        type == 'phone' ? [FilteringTextInputFormatter.digitsOnly] : null,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(width: 1),
      ),
      hintText: hint,
      labelText: label,
      suffixIcon: IconButton(
        icon: icon,
        onPressed: () {},
      ),
      hintStyle: TextStyle(
        fontSize: 14.r,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
  );
}
