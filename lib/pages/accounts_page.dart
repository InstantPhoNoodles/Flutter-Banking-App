import 'package:banking_app/components/bank_account.dart';
import 'package:banking_app/components/login_footer.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Icon(Icons.help_outline, size: 36, color: Colors.blue[800]),
                    Icon(Icons.landscape, size: 48, color: Colors.blue[800]),
                    Icon(Icons.account_circle_outlined, size: 36, color: Colors.blue[800]),
                  ],
                ),
                SizedBox(height: 20),

                Divider(
                  color: Colors.blue[800],       // Line color
                  thickness: 2,             // Line thickness
                  indent: 5,               // Left spacing
                  endIndent: 5,            // Right spacing
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text('Accounts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                    Icon(Icons.arrow_drop_down_circle_outlined, size: 36, color: Colors.blue[800]),
                  ],
                ),
                SizedBox(height: 20),

                Text('Bank Accounts (2)'),
                SizedBox(height: 5),
                
                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue[800]!, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Text('Checkings', style: TextStyle(fontSize: 18)),
                        Text('\$123.00', style: TextStyle(fontSize: 24)),
                        Text('Available Balance', style: TextStyle(fontSize: 12)),
                        Divider(
                          color: Colors.grey,       // Line color
                          thickness: 2,             // Line thickness
                          indent: 5,               // Left spacing
                          endIndent: 5,            // Right spacing
                        ),
                        Text('Savings', style: TextStyle(fontSize: 18)),
                        Text('\$1230.00', style: TextStyle(fontSize: 24)),
                        Text('Available Balance', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Text('Credit Cards (2)'),
                SizedBox(height: 5),
                

                Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue[800]!, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Text('Visa Credit Card', style: TextStyle(fontSize: 18)),
                        Text('\$12.30', style: TextStyle(fontSize: 24)),
                        Text('Current Balance', style: TextStyle(fontSize: 12)),
                        Divider(
                          color: Colors.grey,       // Line color
                          thickness: 2,             // Line thickness
                          indent: 5,               // Left spacing
                          endIndent: 5,            // Right spacing
                        ),
                        Text('MasterCard Credit Card', style: TextStyle(fontSize: 18)),
                        Text('\$1.23', style: TextStyle(fontSize: 24)),
                        Text('Current Balance', style: TextStyle(fontSize: 12)),
                      ],
                    ),
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
