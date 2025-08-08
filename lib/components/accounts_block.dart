import 'package:banking_app/components/account_box.dart';
import 'package:flutter/material.dart';

class AccountBlock extends StatelessWidget {
  final AccountBox account1;
  final AccountBox account2;

  const AccountBlock({super.key, required this.account1, required this.account2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //padding: const EdgeInsets.all(10.0),

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue[800]!, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        children: [
          account1,

          Divider(
            color: Colors.black,
            thickness: 1.5,
            indent: 15,
            endIndent: 15,
          ),

          account2,
        ],

      ),

      
    );
  }
}