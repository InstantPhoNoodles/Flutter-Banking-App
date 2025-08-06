import 'package:banking_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'National Bank',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
