import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  const LoginField({
    super.key,
    required this.hintText,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      cursorColor: Colors.blue,

      decoration: InputDecoration(
        hintText: hintText,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}