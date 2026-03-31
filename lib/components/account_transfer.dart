import 'package:banking_app/components/dropdown_accounts.dart';
import 'package:banking_app/components/money_input_field.dart';
import 'package:banking_app/components/flex_button.dart';
import 'package:banking_app/models/account.dart';
import 'package:banking_app/providers/accounts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountTransfer extends StatefulWidget {
  const AccountTransfer({super.key});

  @override
  State<AccountTransfer> createState() => _AccountTransferState();
}

class _AccountTransferState extends State<AccountTransfer> {
  Account? _fromAccount;
  Account? _toAccount;
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _reset() {
    setState(() {
      _fromAccount = null;
      _toAccount = null;
      _amountController.clear();
    });
  }

  void _submit() {
    final amount = double.tryParse(_amountController.text.trim().replaceAll(',', '')) ?? 0;
    debugPrint('Raw input: "${_amountController.text}" | Parsed: $amount');

    if (_fromAccount == null || _toAccount == null) {
      _showSnackbar('Please select both accounts.', success: false);
      return;
    }
    if (_fromAccount!.accountNumber == _toAccount!.accountNumber) {
      _showSnackbar('From and To accounts must be different.', success: false);
      return;
    }
    if (amount <= 0) {
      _showSnackbar('Enter a valid amount greater than \$0.', success: false);
      return;
    }

    final success = context.read<AccountsProvider>().transfer(
      fromAcnt: _fromAccount!.accountNumber,
      toAcnt: _toAccount!.accountNumber,
      amount: amount,
    );

    if (success) {
      _showSnackbar(
        'Transferred \$${amount.toStringAsFixed(2)} from ${_fromAccount!.accountName} to ${_toAccount!.accountName}.',
        success: true,
      );
      _reset();
    } else {
      _showSnackbar('Insufficient funds in ${_fromAccount!.accountName}.', success: false);
    }
  }

  void _showSnackbar(String message, {required bool success}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green[700] : Colors.red[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accounts = context.watch<AccountsProvider>().accounts.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Make a Transfer', style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 5),

        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue[800]!, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From:', style: TextStyle(fontWeight: FontWeight.w600)),
              DropdownAccounts(
                allAccounts: accounts,
                selectedAccount: _fromAccount,
                onChanged: (account) => setState(() => _fromAccount = account),
              ),

              Text('To:', style: TextStyle(fontWeight: FontWeight.w600)),
              DropdownAccounts(
                allAccounts: accounts,
                selectedAccount: _toAccount,
                onChanged: (account) => setState(() => _toAccount = account),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Text('Transfer Amount:'),
                  SizedBox(width: 5),
                  MoneyInputField(controller: _amountController),
                ],
              ),
              SizedBox(height: 10),

              FlexButton(
                text: 'Submit',
                textStyle: TextStyle(color: Colors.white),
                height: 50,
                width: double.infinity,
                color: Colors.blue[800]!,
                pressColor: Colors.blue[900]!,
                ontap: _submit,
              ),
              SizedBox(height: 10),

              FlexButton(
                text: 'Cancel',
                textStyle: TextStyle(color: Colors.blue[800]!),
                height: 50,
                width: double.infinity,
                color: Colors.white,
                hoverColor: Colors.white,
                pressColor: Colors.blue[800]!,
                ontap: _reset,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
