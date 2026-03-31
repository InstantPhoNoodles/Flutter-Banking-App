import 'package:banking_app/components/account_transfer.dart';
import 'package:banking_app/components/accounts_block.dart';
import 'package:banking_app/components/accounts_header.dart';
import 'package:banking_app/components/login_footer.dart';
import 'package:banking_app/pages/placeholder_page.dart';
import 'package:banking_app/providers/accounts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AccountsProvider>();
    
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
                Text('Bank Accounts (${provider.bankAccounts.length})',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                AccountBlock(accounts: provider.bankAccounts),
                const SizedBox(height: 20),

                Text('Credit Cards (${provider.creditCards.length})',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                AccountBlock(accounts: provider.creditCards),
                const SizedBox(height: 20),

                AccountTransfer(),
                const SizedBox(height: 20),

                const LoginFooter(),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
