import 'package:banking_app/pages/placeholder_page.dart';
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
              HoverText(
                text: 'Open an Account',
                color: Colors.blue[800]!,
                hoverColor: Colors.purple[800]!,
                pressColor: Colors.purple[400]!,
                route: PlaceholderPage(),
              ),
              Text('  |  '),
              HoverText(
                text: 'Privacy',
                color: Colors.blue[800]!,
                hoverColor: Colors.purple[800]!,
                pressColor: Colors.purple[400]!,
                route: PlaceholderPage(),
              ),
              Text('  |  '),
              HoverText(
                text: 'Questions',
                color: Colors.blue[800]!,
                hoverColor: Colors.purple[800]!,
                pressColor: Colors.purple[400]!,
                route: PlaceholderPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
