import 'package:banking_app/components/dropdown_accounts.dart';
import 'package:banking_app/components/money_input_field.dart';
import 'package:banking_app/components/flex_button.dart';
import 'package:banking_app/models/account.dart';
import 'package:flutter/material.dart';

class AccountTransfer extends StatelessWidget {
  final List<Account> allAccounts;
  
  const AccountTransfer({super.key, required this.allAccounts});
  
  @override
  Widget build(BuildContext context) {
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
              DropdownAccounts(allAccounts: allAccounts),
              Text('To:', style: TextStyle(fontWeight: FontWeight.w600)),
              DropdownAccounts(allAccounts: allAccounts),
              SizedBox(height: 10),

              Row(
                children: [
                  Text('Transfer Amount:'),
                  SizedBox(width: 5),
                  MoneyInputField(),
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
                ontap: null
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
                ontap: null
              ),
            ],
          ),
        ),
      ],
    );
  }
}