import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;

  const HoverText({
    super.key,
    required this.text
  });

  @override
  HoverTextState createState() => HoverTextState();
}

class HoverTextState extends State<HoverText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      
      child: GestureDetector(
        child: Text(
          widget.text,
          style: TextStyle(
            color: _isHovering ? Colors.purple[800] : Colors.blue[800],
          ),
        ),
      ),
    );
  }
}