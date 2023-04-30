import 'package:flutter/material.dart';

void displaySnackBar(BuildContext ctxt, String txt) {
  ScaffoldMessenger.of(ctxt).showSnackBar(SnackBar(content: Text(txt)));
}
