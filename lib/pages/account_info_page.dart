import 'package:banking_app/models/account.dart';
import 'package:flutter/material.dart';

class AccountInfoPage extends StatelessWidget {
  final Account account;
  
  const AccountInfoPage({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("${account.accountName} - ${account.accountNumber}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                SizedBox(height: 15),

                // Account Info Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue[800]!, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('\$${account.balance.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                      Text('Available Balance', style: TextStyle(fontSize: 12)),
                      SizedBox(height: 25),

                      Text('Account Details', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      Text('Present Balance: \$${account.balance.toStringAsFixed(2)}'),
                      Text('Account Number: ${account.accountNumber}'),
                      Text('Routing Number: 32134588826939'),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Transaction Info Box
                Container(
                  width: double.infinity,
                  height: 250,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue[800]!, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}