import 'package:banking_app/components/account_box.dart';
import 'package:banking_app/models/account.dart';
import 'package:banking_app/pages/account_info_page.dart';
import 'package:banking_app/pages/credit_account_page.dart';
import 'package:flutter/material.dart';

class AccountBlock extends StatelessWidget {
  final List<Account> accounts;

  const AccountBlock({super.key, required this.accounts});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue[800]!, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        children: accounts.map((account) {
          return AccountBox(
            name: '${account.accountName} - ${account.accountNumber}',
            balance: '\$${account.balance.toStringAsFixed(2)}',
            route: account.type == AccountType.credit
                  ? CreditCardInfoPage(account: account)
                  : AccountInfoPage(account: account),
          );
        }).toList(),
      ),
    );
  }
}
