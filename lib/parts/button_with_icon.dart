import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final onPressed;
  final icon;
  final label;


  ButtonWithIcon({this.onPressed, this.icon,this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: null,
            icon: icon,
            label: Text(label)),
      ),
    );
  }
}
