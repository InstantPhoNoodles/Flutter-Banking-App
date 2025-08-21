import 'package:banking_app/components/account_box.dart';
import 'package:banking_app/components/accounts_block.dart';
import 'package:banking_app/components/accounts_header.dart';
import 'package:banking_app/components/login_footer.dart';
import 'package:banking_app/pages/account_info_page.dart';
import 'package:banking_app/pages/placeholder_page.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/models/account_model.dart';

class AccountsPage extends StatelessWidget {
  AccountsPage({super.key});

  final List<Account> bankAccounts = [
    Account(name: "Checkings", number: "(...1324)", balance: 1200.50),
    Account(name: "Savings", number: "(...1434)", balance: 4500.75),
  ];

  final List<Account> creditCards = [
    Account(name: "Visa Credit Card", number: "(...14845)", balance: 350.25),
    Account(name: "MasterCard Credit Card", number: "(...2488)", balance: 1200.00),
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
                AccountBlock(
                  account1: AccountBox(
                    name: '${bankAccounts[0].name} - ${bankAccounts[0].number}',
                    balance: '\$${bankAccounts[0].balance.toStringAsFixed(2)}',
                    route: AccountInfoPage(),
                  ),
                  account2: AccountBox(
                    name: '${bankAccounts[1].name} - ${bankAccounts[1].number}',
                    balance: '\$${bankAccounts[1].balance.toStringAsFixed(2)}',
                    route: AccountInfoPage(),
                  ),
                ),
                SizedBox(height: 20),

                // Credit Card Accounts Block
                Text('Credit Cards (${creditCards.length})', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                AccountBlock(
                  account1: AccountBox(
                    name: '${creditCards[0].name} - ${creditCards[0].number}',
                    balance: '\$${creditCards[0].balance.toStringAsFixed(2)}',
                    route: AccountInfoPage(),
                  ),
                  account2: AccountBox(
                    name: '${creditCards[1].name} - ${creditCards[1].number}',
                    balance: '\$${creditCards[1].balance.toStringAsFixed(2)}',
                    route: AccountInfoPage(),
                  ),
                ),
                SizedBox(height: 20),

                Text('Explore More of Our Products', style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),

                // Bank Services Products Ads
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150,
                      width: 100,
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 100,
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
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
