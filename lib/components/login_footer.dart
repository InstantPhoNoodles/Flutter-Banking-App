import 'package:flutter/material.dart';
import 'package:banking_app/components/hover_text.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoverText(text: 'Open an Account'),
              Text('  |  '),
              HoverText(text: 'Privacy'),
              Text('  |  '),
              HoverText(text: 'Questions?'),
            ],
          ),
        ],
      ),
    );
  }
}
