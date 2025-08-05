import 'package:banking_app/components/login_footer.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/components/login_box.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_page_bg.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          // Main Content For Login Page
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.landscape, size: 44, color: Colors.green[900]),
                        Icon(Icons.park, size: 44, color: Colors.green[900]),
                      ],
                    ),

                    SizedBox(height: 20),
                    Text(
                      'Welcome to National Bank!',
                      style: TextStyle(fontSize: 24,
                      color: Colors.white),
                    ),
                    
                    // Login Box Widget
                    SizedBox(height: 100),
                    LoginBox(),

                    SizedBox(height: 175),
                    LoginFooter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
