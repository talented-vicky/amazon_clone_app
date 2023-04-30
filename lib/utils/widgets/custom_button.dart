import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.txt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(250, 50),
        ),
        child: Text(txt));
  }
}
