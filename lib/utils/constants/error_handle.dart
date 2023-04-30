import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:amazon_app_clone/utils/constants/snack_bar.dart';

void errorHandler({
  required http.Response resp,
  required BuildContext ctxt,
  required VoidCallback onSucc,
}) {
  switch (resp.statusCode) {
    case 200:
      onSucc();
      break;
    case 400:
      displaySnackBar(ctxt, jsonDecode(resp.body)['msg']);
      break;
    // first passed resp.body from json to string before accessing msg/error
    // value, which are both keys in my getUser json return object
    case 500:
      displaySnackBar(ctxt, jsonDecode(resp.body)['error']);
      break;
    default:
      displaySnackBar(ctxt, resp.body);
  }
}

// A4 technologies
// Swift gas
// Agbenya => word of life
