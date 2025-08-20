import 'package:banking_app/pages/account_info_page.dart';
import 'package:banking_app/pages/accounts_page.dart';
import 'package:banking_app/pages/authentication_page.dart';
import 'package:banking_app/pages/login_page.dart';
import 'package:banking_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:banking_app/models/account_model.dart';
import 'package:banking_app/models/database_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await seedDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'National Bank',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: lightMode,

      home: AccountsPage(),
    );
  }
}

Future<void> seedDatabase() async {
  final db = DatabaseHelper.instance;

  // Only seed if table is empty
  final accounts = await db.getAccounts();
  if (accounts.isEmpty) {
    await db.insertAccount(Account(accountNumber: 123456789, accountType: 'Checking', balance: 1500.50));
    await db.insertAccount(Account(accountNumber: 123456987, accountType: 'Savings', balance: 5000.50));
    await db.insertAccount(Account(accountNumber: 321654987, accountType: 'Visa Credit Card', balance: 150.50));
    await db.insertAccount(Account(accountNumber: 456123789, accountType: 'MasterCard Credit Card', balance: 50.50));
  }
}
