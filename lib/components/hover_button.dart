import 'package:banking_app/pages/accounts_page.dart';
import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final double width;
  final Color color;
  final Color hoverColor;

  const HoverButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.height,
    required this.width,
    required this.color,
    required this.hoverColor,
  });

  @override
  HoverButtonState createState() => HoverButtonState();
}

class HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
     
      
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountsPage())
          );
        },
        
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: _isHovering ? widget.hoverColor : widget.color,
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