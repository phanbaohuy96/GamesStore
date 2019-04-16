import 'package:flutter/material.dart';

class LabelSubLabelValue extends StatelessWidget {

  final String label, value;
  final TextStyle labelStyle, valueStyle;

  const LabelSubLabelValue({this.label, this.value, this.labelStyle, this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(value, style: valueStyle, overflow: TextOverflow.ellipsis,),
        Text(label, style: labelStyle, overflow: TextOverflow.ellipsis)
      ],
    );
  }
}