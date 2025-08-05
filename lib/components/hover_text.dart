import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final Color color;
  final Color hoverColor;
  final Color pressColor;
  final Widget route;

  const HoverText({
    super.key,
    required this.text,
    required this.color,
    required this.hoverColor,
    required this.pressColor,
    required this.route
  });

  @override
  HoverTextState createState() => HoverTextState();
}

class HoverTextState extends State<HoverText> {
  bool _isHovering = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color currentColor;
    if (_isPressed) {
      currentColor = widget.pressColor;
    } else if (_isHovering) {
      currentColor = widget.hoverColor;
    } else {
      currentColor = widget.color;
    }


    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.route),
          );
        },
        onTapCancel: () => setState(() => _isPressed = false),

        child: Text(
          widget.text,
          style: TextStyle(
            color: currentColor,
          ),
        ),
      ),
    );
  }
}