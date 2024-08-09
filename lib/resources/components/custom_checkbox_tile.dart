import 'package:flutter/material.dart';

class CustomCheckBoxTile extends StatelessWidget {
  bool isChecked;
  String title;
  ListTileControlAffinity? controlAffinity;
  void Function(bool? value) onChanged;

  CustomCheckBoxTile(
      {super.key,
      required this.isChecked,
      required this.title,
      required this.onChanged,
      this.controlAffinity});

  WidgetStateProperty<Color?> _getFillColor() {
    return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.green; // Color when the checkbox is selected
      }
      if (states.contains(WidgetState.hovered)) {
        return Colors.blue; // Color when the checkbox is hovered
      }
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey; // Color when the checkbox is disabled
      }
      return null; // Default color
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        controlAffinity: controlAffinity ?? ListTileControlAffinity.leading,
        dense: true,
        fillColor: _getFillColor(),
        splashRadius: 10,
        activeColor: Colors.white,
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return Colors.blueAccent;
        }),
        side: const BorderSide(color: Colors.white),
        title: Text(
          title.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        value: isChecked,
        onChanged: onChanged);
  }
}
