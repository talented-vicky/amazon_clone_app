import 'package:flutter/material.dart';

import 'package:amazon_app_clone/features/auth/screens/auth_screen.dart';

import './constants/global_var.dart';
import './router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVar.backColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVar.secColor,
            //color for everything (appbar, buttons, etc) excluding texts
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
