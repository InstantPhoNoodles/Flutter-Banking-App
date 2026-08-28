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
    final accounts = context.watch<AccountsProvider>().bankAccounts.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Transfer', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('From', style: TextStyle(fontWeight: FontWeight.w600)),
                        DropdownAccounts(
                          allAccounts: accounts,
                          selectedAccount: _fromAccount,
                          onChanged: (account) => setState(() => _fromAccount = account),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, left: 4, right: 4),
                    child: Icon(Icons.arrow_forward, color: Colors.blue[800]),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('To', style: TextStyle(fontWeight: FontWeight.w600)),
                        DropdownAccounts(
                          allAccounts: accounts,
                          selectedAccount: _toAccount,
                          onChanged: (account) => setState(() => _toAccount = account),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Amount
              Row(
                children: [
                  Text('Amount:', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(width: 8),
                  MoneyInputField(controller: _amountController),
                ],
              ),
              const SizedBox(height: 10),

              // Cancel / Submit
              Row(
                children: [
                  Expanded(
                    child: FlexButton(
                      text: 'Cancel',
                      textStyle: TextStyle(color: Colors.blue[800]!),
                      height: 45,
                      width: double.infinity,
                      color: Colors.white,
                      pressColor: Colors.blue[50]!,
                      ontap: _reset,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FlexButton(
                      text: 'Submit',
                      textStyle: TextStyle(color: Colors.white),
                      height: 45,
                      width: double.infinity,
                      color: Colors.blue[800]!,
                      pressColor: Colors.blue[900]!,
                      ontap: _submit,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
