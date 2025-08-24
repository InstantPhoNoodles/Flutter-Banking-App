import 'package:flutter/material.dart';

/// Class that lets you format a button with hover and press
/// functionality. Has an ontap field used to execute a function
/// Currently on used for sign in button in login page.
class FlexButton extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final double height;
  final double width;
  final Color activeText;
  final Color color;
  final Color hoverColor;
  final Color pressColor;
  final Function()? ontap;

  const FlexButton({
    super.key,
    required this.text,
    this.textStyle,
    required this.height,
    required this.width,
    this.activeText = Colors.white,
    this.color = const Color(0xFF1565C0),
    this.hoverColor = const Color(0xFF1565C0),
    this.pressColor = const Color(0xFF1565C0),
    required this.ontap
  });

  @override
  FlexButtonState createState() => FlexButtonState();
}

class FlexButtonState extends State<FlexButton> {
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

    Color currentTextColor =
        _isPressed ? widget.activeText : (widget.textStyle?.color ?? Colors.black);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
     
      
      child: GestureDetector(
        onTap: widget.ontap,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: currentColor,
              border: Border.all(color: widget.pressColor, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: widget.textStyle?.copyWith(color: currentTextColor) ??
                TextStyle(color: currentTextColor),
            ),
          ),
        )
      ),
    );
  }
}