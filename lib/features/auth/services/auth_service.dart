import 'package:amazon_app_clone/utils/constants/error_handle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import "package:amazon_app_clone/models/user.dart";
import 'package:amazon_app_clone/utils/constants/global_var.dart';
import 'package:amazon_app_clone/utils/constants/snack_bar.dart';

class AuthService {
  // sign up user
  void signIn(
      {required String email,
      required BuildContext context,
      required String name,
      required String password
      // we will need the buildContext in case we need to display errors to  user

      }) async {
    try {
      User user = User(
          id: '', email: '', password: '', address: '', type: '', token: '');
      http.Response response = await http.post(Uri.parse('$uri/api/user'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: user.toJson());
      errorHandler(
          resp: response,
          ctxt: context,
          onSucc: () => {
                //
                displaySnackBar(context, 'Success! Proceed to sign in')
              });
      // await http.post(Uri.parse('$uri/api/user'));
    } catch (err) {
      displaySnackBar(context, err.toString());
    }
  }
}
