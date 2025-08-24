import 'package:banking_app/models/account.dart';
import 'package:flutter/material.dart';

class DropdownAccounts extends StatefulWidget {
  final List<Account> allAccounts;

  const DropdownAccounts({super.key, required this.allAccounts});

  @override
  // ignore: library_private_types_in_public_api
  _DropdownAccountsState createState() => _DropdownAccountsState();
}

class _DropdownAccountsState extends State<DropdownAccounts> {
  Account? selectedAccount; // holds current selection

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Account>(
      value: selectedAccount,
      hint: Text("Select Account"),
      isExpanded: true,
      items: widget.allAccounts.map((account) {
        return DropdownMenuItem<Account>(
          value: account,
          child: Text("${account.accountName} - ${account.accountNumber}", softWrap: false),
        );
      }).toList(),
      onChanged: (newValue) {setState(() {selectedAccount = newValue;});},
    );
  }
}
