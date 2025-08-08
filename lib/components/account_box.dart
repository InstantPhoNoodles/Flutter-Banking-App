import 'package:flutter/material.dart';

class AccountBox extends StatefulWidget {
  final String name;
  final String balance;
  final Widget route; 

  const AccountBox({
    super.key,
    required this.name,
    required this.balance,
    required this.route
  });

  @override
  AccountBoxState createState() => AccountBoxState();
}

class AccountBoxState extends State<AccountBox> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color currentColor;
    if (_isPressed) {
      currentColor = Colors.grey;
    } else {
      currentColor = Color.fromRGBO(250, 250, 250, 1.0);
    }

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.route),
        );
      },
      onTapCancel: () => setState(() => _isPressed = false),

      child: Container(
        padding: const EdgeInsets.all(10.0),

        decoration: BoxDecoration(
          color: currentColor,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Row(
              children: [
                Text(widget.name, style: TextStyle(fontSize: 18)),
                Icon(Icons.arrow_right, size: 24),
              ],
            ),
            Text(widget.balance, style: TextStyle(fontSize: 24)),
            Text('Available Balance', style: TextStyle(fontSize: 12)),
          ],
        ),
      )
    );
  }
}
