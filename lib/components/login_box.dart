import 'package:flutter/material.dart';
import 'package:banking_app/components/login_field.dart';
import 'package:banking_app/components/hover_text.dart';
import 'package:banking_app/components/hover_button.dart';

class LoginBox extends StatelessWidget {
  const LoginBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),

      // Elements Inside Login Box
      child: Column(
        children: [
          Text('Log In', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),

          // Username Input Field
          LoginField(hintText: 'Username', obscureText: false),
          SizedBox(height: 5),

          // Password Input Field
          LoginField(hintText: 'Password', obscureText: true),
          SizedBox(height: 10),

          // Sign in Button Widget
          HoverButton(
            text: 'Sign In',
            textStyle: TextStyle(color: Colors.white),
            height: 50,
            width: 260,
            color: Colors.blue[800]!,
            hoverColor: Colors.blue[900]!,
            pressColor: Colors.blue[700]!,
          ),

          SizedBox(height: 5),

          Row(
            children: [HoverText(text: 'Forgot Username or Password?')],
          ),

          Row(
            children: [HoverText(text: 'Not a Memember? Sign Up.')],
          ),
        ],
      ),
    );
  }
}