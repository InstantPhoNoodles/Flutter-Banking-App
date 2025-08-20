class Account {
  final int accountNumber;
  final String accountType;
  final double balance;

  Account({
    required this.accountNumber,
    required this.accountType,
    required this.balance
  });

  Map<String, dynamic> toMap() {
    return {
      'accountNumber': accountNumber,
      'accountType': accountType,
      'balance': balance,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountNumber: map['accountNumber'],
      accountType: map['accountType'],
      balance: map['balance'],
    );
  }
}
