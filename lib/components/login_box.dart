import 'package:banking_app/pages/accounts_page.dart';
import 'package:banking_app/pages/placeholder_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:banking_app/components/login_field.dart';
import 'package:banking_app/components/hover_text.dart';
import 'package:banking_app/components/signin_button.dart';
import 'package:flutter/material.dart';

class LoginBox extends StatefulWidget {
  const LoginBox({super.key});

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  void userSignIn(BuildContext context) async {
    try {
      // When user presses sign in button, check that it is a valid login credential
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // If login is valid, navigate to Accounts Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountsPage()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Sign-in failed')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10.0)
      ),

      // Elements Inside Login Box
      child: Column(
        children: [
          Text('Log In', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),

          // Username Input Field
          LoginField(controller: emailController, hintText: 'Email', obscureText: false),
          SizedBox(height: 5),

          // Password Input Field
          LoginField(controller: passwordController, hintText: 'Password', obscureText: true),
          SizedBox(height: 10),

          // Sign in Button Widget
          SigninButton(
            text: 'Sign In',
            textStyle: TextStyle(color: Colors.white),
            height: 50,
            width: 260,
            color: Colors.blue[800]!,
            hoverColor: Colors.blue[900]!,
            pressColor: Colors.blue[700]!,
            ontap: () => userSignIn(context),
          ),
          SizedBox(height: 5),

          // Forgot login link. I don't remember why it is in a row.
          Container(
            alignment: Alignment.centerLeft,
            child: HoverText(
              text: 'Forgot Username or Password?',
              color: Theme.of(context).colorScheme.secondary,
              hoverColor: Theme.of(context).colorScheme.tertiary,
              pressColor: Colors.purple[400]!,
              route: PlaceholderPage(),
            ),
          ),
          
          // Sign up link. I don't remember why it is in a row.
          Container(
            alignment: Alignment.centerLeft,
            child: HoverText(
              text: 'Not a Member? Sign Up.',
              color: Theme.of(context).colorScheme.secondary,
              hoverColor: Theme.of(context).colorScheme.tertiary,
              pressColor: Colors.purple[400]!,
              route: PlaceholderPage(),
            ),
          ),
        ],
      ),
    );
  }
}