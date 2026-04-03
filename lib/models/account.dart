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

  Map<String, dynamic> toJson() => {
    'accountName': accountName,
    'accountNumber': accountNumber,
    'email': email,
    'type': type.name,
    'balance': balance,
  };

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    accountName: json['accountName'],
    accountNumber: json['accountNumber'],
    email: json['email'],
    type: AccountType.values.byName(json['type']),
    balance: json['balance'],
  );
}

enum AccountType { checking, savings, credit }
