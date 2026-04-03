import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:banking_app/models/account.dart';

class AccountsProvider extends ChangeNotifier {
   List<Account> _accounts = [];

  AccountsProvider() {
    _loadAccounts();
  }

  Future<void> _loadAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('accounts');

    if (data != null) {
      final List decoded = jsonDecode(data);
      _accounts = decoded.map((e) => Account.fromJson(e)).toList();
    } else {
      // First launch — use defaults
      _accounts = _defaultAccounts();
    }
    notifyListeners();
  }

  Future<void> _saveAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final String data = jsonEncode(_accounts.map((a) => a.toJson()).toList());
    prefs.setString('accounts', data);
  }

  List<Account> get accounts => List.unmodifiable(_accounts);

  List<Account> get bankAccounts =>
      _accounts.where((a) => a.type == AccountType.checking || a.type == AccountType.savings).toList();

  List<Account> get creditCards =>
      _accounts.where((a) => a.type == AccountType.credit).toList();

  // Get accounts belonging to a specific email
  List<Account> accountsForEmail(String email) =>
      _accounts.where((a) => a.email == email).toList();

  // Update the balance of a single account
  void updateBalance(String accountId, double newBalance) {
    final account = _accounts.firstWhere((a) => a.accountNumber == accountId);
    account.balance = newBalance;
    _saveAccounts();
    notifyListeners();
  }

  // Transfer funds between two accounts
  bool transfer({required String fromAcnt, required String toAcnt, required double amount}) {
    if (amount <= 0) return false;

    final from = _accounts.firstWhere((a) => a.accountNumber == fromAcnt);
    final to = _accounts.firstWhere((a) => a.accountNumber == toAcnt);

    if (from.balance < amount) return false; // Insufficient funds

    from.balance -= amount;
    to.balance += amount;
    notifyListeners();
    return true;
  }

  // Pay off credit card using balance from other accounts
  bool payCredit({required String fromAcnt, required String toAcnt, required double amount}) {
    if (amount <= 0) return false;

    final from = _accounts.firstWhere((a) => a.accountNumber == fromAcnt);
    final to = _accounts.firstWhere((a) => a.accountNumber == toAcnt);

    if (from.balance < amount) return false; // Insufficient funds

    from.balance -= amount;
    to.balance -= amount;
    notifyListeners();
    return true;
  }

  // Add a brand new account
  void addAccount(Account account) {
    _accounts.add(account);
    notifyListeners();
  }

  // Remove an account by ID
  void removeAccount(String accountId) {
    _accounts.removeWhere((a) => a.accountNumber == accountId);
    notifyListeners();
  }

  List<Account> _defaultAccounts() => [
    Account(
      accountName: 'Checkings',
      accountNumber: '(...1324)',
      email: 'test1@gmail.com',
      type: AccountType.checking,
      balance: 1000.00
    ),
    Account(
      accountName: 'Savings',
      accountNumber: '(...1434)',
      email: 'test1@gmail.com',
      type: AccountType.savings,
      balance: 5000.00
    ),
    Account(
      accountName: 'Visa Credit Card',
      accountNumber: '(...1484)',
      email: 'test2@gmail.com',
      type: AccountType.credit,
      balance: 75.00,
    ),
    Account(
      accountName: 'MasterCard Credit Card',
      accountNumber: '(...2488)',
      email: 'test2@gmail.com',
      type: AccountType.credit,
      balance: 100.00
    ),
  ];
}
