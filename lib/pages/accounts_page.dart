import 'package:banking_app/components/bank_account.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                BankAccountBox(text: 'Checkings Account'),
                SizedBox(height: 20),
            
                BankAccountBox(text: 'Savings Account'),
                SizedBox(height: 20),
            
                BankAccountBox(text: 'Visa Credit Account'),
                SizedBox(height: 20),
                
                BankAccountBox(text: 'MasterCard Credit Account'),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
