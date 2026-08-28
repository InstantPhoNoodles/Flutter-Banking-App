import 'package:banking_app/components/account_box.dart';
import 'package:banking_app/components/account_transfer.dart';
import 'package:banking_app/components/accounts_header.dart';
import 'package:banking_app/components/login_footer.dart';
import 'package:banking_app/models/account.dart';
import 'package:banking_app/pages/account_info_page.dart';
import 'package:banking_app/pages/credit_account_page.dart';
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
                const SizedBox(height: 20),

                // Accounts Section Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text('Accounts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 10.0),

                // Accounts Block
                Column(
                  children: provider.accounts.map((account) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: AccountBox(
                      name: account.accountName,
                      balance: '\$${account.balance.toStringAsFixed(2)}',
                      route: account.type == AccountType.credit
                          ? CreditCardInfoPage(accountNumber: account.accountNumber)
                          : AccountInfoPage(account: account),
                      type: account.type,
                      number: account.accountNumber,
                    ),
                  )).toList(),
                ),
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
