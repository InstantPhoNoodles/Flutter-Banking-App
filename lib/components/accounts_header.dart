import 'package:banking_app/pages/login_page.dart';
import 'package:banking_app/pages/placeholder_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountsHeader extends StatelessWidget {
  const AccountsHeader({super.key});

  void userSignOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaceholderPage()),
                );
              },
              icon: Icon(Icons.help_outline, size: 28, color: Colors.blue[800]),
            ),
            
            Icon(Icons.landscape, size: 48, color: Colors.blue[800]),
            
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaceholderPage()),
                );
              },
              icon: Icon(Icons.account_circle_outlined, size: 28, color: Colors.blue[800]),
            ),

            IconButton(
              onPressed: () => userSignOut(context),
              icon: Icon(Icons.logout_outlined, size: 28, color: Colors.blue[800]),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.blue[800],
          thickness: 2,
          indent: 4,
          endIndent: 4,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}