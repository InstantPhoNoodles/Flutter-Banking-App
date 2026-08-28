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
                    gradient: LinearGradient(
                      colors: [Colors.blue[900]!, Color.fromARGB(255, 5, 40, 100)], // normal
                      begin: AlignmentGeometry.topLeft,
                      end: AlignmentGeometry.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('\$${account.balance.toStringAsFixed(2)}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white)),
                      Text('Available Balance', style: TextStyle(fontSize: 12, color: Colors.white)),
                      SizedBox(height: 25),

                      Text('Account Details', style: TextStyle(fontSize: 14, color: Colors.white)),
                      Text('Present Balance: \$${account.balance.toStringAsFixed(2)}', style: TextStyle(fontSize: 14, color: Colors.white)),
                      Text('Account Number: ${account.accountNumber}', style: TextStyle(fontSize: 14, color: Colors.white)),
                      Text('Routing Number: 32134588826939', style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: 15),

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