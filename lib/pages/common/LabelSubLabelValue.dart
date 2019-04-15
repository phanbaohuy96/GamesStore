import 'package:flutter/material.dart';

class LabelSubLabelValue extends StatelessWidget {

  final String label, value;
  final TextStyle labelStyle, valueStyle;

  const LabelSubLabelValue({this.label, this.value, this.labelStyle, this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(value, style: valueStyle,),
        Text(label, style: labelStyle,)
      ],
    );
  }
}