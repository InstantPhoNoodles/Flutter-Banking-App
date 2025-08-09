import 'package:banking_app/pages/accounts_page.dart';
import 'package:banking_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return AccountsPage() ;
          }

          // User is not logged in
          else {
            return LoginPage();
          }
        }
      ),
    );
  }
}