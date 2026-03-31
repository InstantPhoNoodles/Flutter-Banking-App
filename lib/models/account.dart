class Account {
  final String accountName;
  final String accountNumber;
  final String email;
  final AccountType type;
  double balance;

  Account({
    required this.accountName,
    required this.accountNumber,
    required this.email,
    required this.type,
    required this.balance
  });
}

enum AccountType { checking, savings, credit }
