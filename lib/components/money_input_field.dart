import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoneyInputField extends StatelessWidget {
  const MoneyInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 100,
        height: 50,
        child: TextField(
          keyboardType: TextInputType.number,
          maxLines: 1,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))],
          decoration: InputDecoration(
            prefixText: "\$ ",
            hintText: "0.00",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue[800]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.purple[800]!),
            ),
          ),
        ),
      ),
    );
  }
}
