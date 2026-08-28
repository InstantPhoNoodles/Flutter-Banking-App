import 'package:banking_app/providers/accounts_provider.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/components/pay_credit_box.dart';
import 'package:provider/provider.dart';

class CreditCardInfoPage extends StatelessWidget {
  final String accountNumber;
  
  const CreditCardInfoPage({super.key, required this.accountNumber});

  @override
  Widget build(BuildContext context) {
    final account = context.watch<AccountsProvider>().accounts
        .firstWhere((a) => a.accountNumber == accountNumber);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("${account.accountName} - ${account.accountNumber} CREDIT CARD INFO", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
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

                PayCreditBox(creditAccount: account),
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