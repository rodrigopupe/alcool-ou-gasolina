import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  final String label;
  final MoneyMaskedTextController controller;

  Input({@required this.label, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label
      ),
      style: TextStyle(
        fontSize: 24,
      ),
      controller: controller,
    );
  }
}
