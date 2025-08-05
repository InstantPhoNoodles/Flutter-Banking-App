import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final double width;
  final Color color;
  final Color hoverColor;
  final Color pressColor;
  final Widget route;

  const HoverButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.height,
    required this.width,
    required this.color,
    required this.hoverColor,
    required this.pressColor,
    required this.route
  });

  @override
  HoverButtonState createState() => HoverButtonState();
}

class HoverButtonState extends State<HoverButton> {
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
        
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: currentColor,
              borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: widget.textStyle,
            ),
          ),
        )
      ),
    );
  }
}