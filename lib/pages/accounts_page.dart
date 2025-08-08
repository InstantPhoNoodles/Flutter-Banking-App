import 'package:banking_app/components/account_box.dart';
import 'package:banking_app/components/accounts_block.dart';
import 'package:banking_app/components/accounts_header.dart';
import 'package:banking_app/components/login_footer.dart';
import 'package:banking_app/pages/account_info_page.dart';
import 'package:banking_app/pages/placeholder_page.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

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
                Text('Bank Accounts (2)', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                AccountBlock(
                  account1: AccountBox(name: 'Checkings - (...1324)', balance: '\$123.00', route: AccountInfoPage(),),
                  account2: AccountBox(name: 'Savings - (...1434)', balance: '\$1230.00', route: AccountInfoPage(),),
                ),
                SizedBox(height: 20),

                // Credit Card Accounts Block
                Text('Credit Cards (2)', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                AccountBlock(
                  account1: AccountBox(name: 'Visa Credit Card - (...14845)', balance: '\$12.30', route: AccountInfoPage(),),
                  account2: AccountBox(name: 'MasterCard Credit Card - (...2488)', balance: '\$1.23', route: AccountInfoPage(),),
                ),
                SizedBox(height: 20),

                Text('Explore More of Our Products', style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 200,
                      width: 75,
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 75,
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 75,
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 75,
                      
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
