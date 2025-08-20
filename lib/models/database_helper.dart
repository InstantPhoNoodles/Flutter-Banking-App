import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'account_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _db;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'banking_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE accounts (
            accountNumber INTEGER PRIMARY KEY AUTOINCREMENT,
            accountType TEXT,
            balance REAL
          )
        ''');
      },
    );
  }

  // Insert account
  Future<int> insertAccount(Account account) async {
    final db = await database;
    return await db.insert('accounts', account.toMap());
  }

  // Get all accounts
  Future<List<Account>> getAccounts() async {
    final db = await database;
    final result = await db.query('accounts');
    return result.map((map) => Account.fromMap(map)).toList();
  }

  // Update account
  Future<int> updateAccount(Account account) async {
    final db = await database;
    return await db.update(
      'accounts',
      account.toMap(),
      where: 'accountNumber = ?',
      whereArgs: [account.accountNumber],
    );
  }

  // Delete account
  Future<int> deleteAccount(int accountNumber) async {
    final db = await database;
    return await db.delete('accounts', where: 'accountNumber = ?', whereArgs: [accountNumber]);
  }
}
