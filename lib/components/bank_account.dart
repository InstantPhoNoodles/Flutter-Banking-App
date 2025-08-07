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
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue[800]!, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}