import 'package:banking_app/components/login_footer.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/components/login_box.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              isDarkMode
                ? 'assets/images/loginpage_bg_dark2.jpg'
                : 'assets/images/loginpage_bg_light3.jpg',
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
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.landscape, size: 48, color: Colors.blue[800])],
                    ),

                    SizedBox(height: 20),
                    Text(
                      'Welcome to National Bank!',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    
                    // Login Box Widget
                    SizedBox(height: 80),
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
