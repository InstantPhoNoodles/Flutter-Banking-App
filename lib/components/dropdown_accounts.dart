import 'package:banking_app/models/account.dart';
import 'package:flutter/material.dart';

class DropdownAccounts extends StatelessWidget  {
  final List<Account> allAccounts;
  final Account? selectedAccount;
  final ValueChanged<Account?> onChanged;

  const DropdownAccounts({
    super.key,
    required this.allAccounts,
    required this.selectedAccount, 
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Account>(
      value: selectedAccount,
      hint: Text("Select Account"),
      isExpanded: true,
      items: allAccounts.map((account) {
        return DropdownMenuItem<Account>(
          value: account,
          child: Text("${account.accountName} - ${account.accountNumber}", softWrap: false),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

/*class _DropdownAccountsState extends State<DropdownAccounts> {
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
}*/
