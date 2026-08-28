import 'package:banking_app/models/account.dart';
import 'package:flutter/material.dart';

class AccountBox extends StatefulWidget {
  final String name;
  final String balance;
  final Widget route;
  final AccountType type;
  final String number;
  
  const AccountBox({
    super.key,
    required this.name,
    required this.balance,
    required this.route,
    required this.type,
    required this.number,
  });

  @override
  AccountBoxState createState() => AccountBoxState();
}

class AccountBoxState extends State<AccountBox> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        FocusScope.of(context).unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.route),
        );
      },
      onTapCancel: () => setState(() => _isPressed = false),

      child: Container(
        padding: const EdgeInsets.all(15.0),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isPressed
                ? [Colors.blue[900]!, Color.fromARGB(255, 5, 40, 100)] // pressed
                : [Color.fromARGB(255, 5, 40, 100), Colors.blue[900]!], // normal
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Row(
              children: [
                Text(widget.name, style: TextStyle(fontSize:26, color: Colors.white)), // Account Name
                Icon(Icons.arrow_right, size: 28, color: Colors.white,),  // More Arrow
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.type == AccountType.credit ? 'Current Balance' : 'Available Balance', // Balance Message
              style: TextStyle(fontSize: 12, color: Colors.white)
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(widget.balance, style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w500)), // Balance
                Text(widget.number, style: TextStyle(fontSize: 18, color: Colors.white)), // Account number abrv.
              ],
            ),
          ],
        ),
      )
    );
  }
}
