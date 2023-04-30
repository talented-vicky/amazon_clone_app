import 'package:flutter/material.dart';

import '../constants/global_var.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController control;
  final String hintTxt;
  const CustomTextField(
      {super.key, required this.control, required this.hintTxt});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          //
        },
        controller: control,
        decoration: InputDecoration(
          hintText: hintTxt,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: GlobalVar.outlineColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: GlobalVar.outlineColor)),
        ));
  }
}
