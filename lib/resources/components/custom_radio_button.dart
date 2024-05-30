import 'package:flutter/material.dart';

enum MaritalStatus { single, married }

MaritalStatus? _maritalStatus;

class CustomRadioButton extends StatefulWidget {

  final void Function(MaritalStatus?) onChanged;
  final String title;
  final MaritalStatus value;
  final MaritalStatus groupValue;

  const CustomRadioButton({super.key
  ,required this.onChanged,
    required this.title,
    required this.value,
    required this.groupValue


  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile<MaritalStatus>(
      title: Text(
        widget.title,
        style: TextStyle(
            color: Colors.white
                .withOpacity(0.65)),
      ),
      value: widget.value,
      groupValue: widget.groupValue,
      dense: true,
      activeColor:
      Colors.white.withOpacity(0.65),
      onChanged: widget.onChanged

    );
  }
}

