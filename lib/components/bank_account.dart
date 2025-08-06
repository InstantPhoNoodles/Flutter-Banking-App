import 'package:flutter/material.dart';

class BankAccountBox extends StatelessWidget {
  final String text;

  const BankAccountBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,

      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(20),
      ),

      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}