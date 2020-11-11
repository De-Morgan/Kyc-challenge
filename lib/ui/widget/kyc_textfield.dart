import 'package:flutter/material.dart';

class KycTextField extends StatelessWidget {
  final String label;
  final TextFormField textFormField;

  const KycTextField({Key key, this.label = '', @required this.textFormField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(label), const SizedBox(height: 10), textFormField],
    );
  }
}
