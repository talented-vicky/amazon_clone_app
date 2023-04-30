import 'package:flutter/material.dart';

import '../../../utils/constants/global_var.dart';
import '../../../utils/widgets/custom_textfield.dart';
import '../../../utils/widgets/custom_button.dart';

enum AuthEnum { signin, signup } // an object whose key and values are same

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const routeName = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthEnum _auth = AuthEnum.signup;
  // variable is _auth and data type is AuthEnum, an enum object
  // hence this is the default (what we see on page landing)

  final _signUpKey = GlobalKey<FormState>();
  final _signInKey = GlobalKey<FormState>();

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _nameCtrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _nameCtrl.dispose();
    // dispose method helps release the memory allocated to variables when
    // state object is removed,

    // for example, if using a stream in my application then I have to release
    // memory allocated to the stream controller. Otherwise, my app may get a
    // warning from the PlayStore and AppStore about memory leakage.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVar.greybackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              const Text(
                "User Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: _auth == AuthEnum.signup
                    ? GlobalVar.backColor
                    : GlobalVar.greybackColor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: GlobalVar.secColor,
                    value: AuthEnum.signup,
                    groupValue: _auth, //we passed this into the radio button
                    onChanged: (AuthEnum? val) {
                      setState(() {
                        _auth = val!; // ensuring it's never null
                      });
                    }),
              ),
              if (_auth == AuthEnum.signup)
                Container(
                  color: GlobalVar.backColor,
                  padding: const EdgeInsets.all(5),
                  child: Form(
                      key: _signUpKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            control: _nameCtrl,
                            hintTxt: "Full Name",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            control: _emailCtrl,
                            hintTxt: "Email",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            control: _passwordCtrl,
                            hintTxt: "Password",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton(txt: "Sign up", onTap: () {}),
                          const SizedBox(height: 5)
                        ],
                      )),
                ),
              ListTile(
                tileColor: _auth == AuthEnum.signin
                    ? GlobalVar.backColor
                    : GlobalVar.greybackColor,
                title: const Text(
                  "Welcome Back !",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                    activeColor: GlobalVar.secColor,
                    value: AuthEnum.signin,
                    groupValue: _auth, //we passed this into the radio button
                    onChanged: (AuthEnum? val) {
                      setState(() {
                        _auth = val!; // ensuring it's never null
                      });
                    }),
              ),
              if (_auth == AuthEnum.signin)
                Container(
                  color: GlobalVar.backColor,
                  padding: const EdgeInsets.all(5),
                  child: Form(
                      key: _signUpKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            control: _emailCtrl,
                            hintTxt: "Email",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            control: _passwordCtrl,
                            hintTxt: "Password",
                          ),
                          // since my controllers are the same I always keep
                          // user input if user account radio action is changed
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton(txt: "Login", onTap: () {}),
                          const SizedBox(height: 5)
                        ],
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
