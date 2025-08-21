import 'package:banking_app/components/accounts_block.dart';
import 'package:banking_app/components/accounts_header.dart';
import 'package:banking_app/components/login_footer.dart';
import 'package:banking_app/pages/placeholder_page.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/models/account_model.dart';

class AccountsPage extends StatelessWidget {
  AccountsPage({super.key});

  final List<Account> bankAccounts = [
    Account(accountName: "Checkings", accountNumber: "(...1324)", balance: 1275.50),
    Account(accountName: "Savings", accountNumber: "(...1434)", balance: 4525.75),
  ];

  final List<Account> creditCards = [
    Account(accountName: "Visa Credit Card", accountNumber: "(...14845)", balance: 50.25),
    Account(accountName: "MasterCard Credit Card", accountNumber: "(...2488)", balance: 120.00),
    Account(accountName: "MasterCard Credit Card", accountNumber: "(...3458)", balance: 20.45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // Accounts Page Header 
                AccountsHeader(),

                // Accounts Section Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text('Accounts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),

                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlaceholderPage()),
                        );
                      },
                      icon: Icon(Icons.arrow_drop_down_circle_outlined, size: 28, color: Colors.blue[800]),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Regular Bank Accounts Block
                Text('Bank Accounts (${bankAccounts.length})', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                AccountBlock(accounts: bankAccounts),
                SizedBox(height: 20),

                // Credit Card Accounts Block
                Text('Credit Cards (${creditCards.length})', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                AccountBlock(accounts: creditCards),
                SizedBox(height: 20),

                Text('Explore More of Our Products', style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),

                // Bank Services Products Ads
                Container(
                  height: 150,
                  width: double.infinity,
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue[800]!, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                LoginFooter(),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
