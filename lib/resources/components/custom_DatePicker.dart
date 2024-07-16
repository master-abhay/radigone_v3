import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final bool isNumber;
  final String hintText;
  final bool obscureText;
  bool? textCapitalization;
  Widget? icon;
  int? maxLines;
  String? initialValue;
  final void Function(String? value) onSaved;
  final void Function() onTap;
   void Function(String? value)? onChanged;

  TextEditingController? textEditingController;
  bool? doValidation;


  CustomDatePicker(
      {super.key,
        required this.hintText,
        required this.onSaved,
        required this.obscureText,
        required this.isNumber,
        this.icon,
        this.maxLines,
        this.textCapitalization,
        this.initialValue,
        this.textEditingController,
       required this.onTap,
        this.onChanged,
        this.doValidation
      });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onChanged: widget.onChanged,
      controller: widget.textEditingController,
      obscureText: widget.obscureText,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      autofocus: true,
      obscuringCharacter: '*',
      textAlign: TextAlign.justify,
      textCapitalization: widget.textCapitalization == true ? TextCapitalization.sentences : TextCapitalization.none,
      initialValue: widget.initialValue,
      readOnly: true,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02),
        suffix: widget.icon,
        alignLabelWithHint: true,
        hintText: widget.hintText.toLowerCase(),
        hintFadeDuration: const Duration(milliseconds: 500),
        hintStyle:
        TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white)),
        errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red.withOpacity(0.8))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.3))),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white)),
        labelText: widget.hintText,
        labelStyle:
        TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 15),
        filled: true,
        fillColor: Colors.black.withOpacity(0.3),

      ),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType: widget.isNumber ? TextInputType.phone : TextInputType.text,
      validator: widget.doValidation == null ? (value) {
        if (value != null && value.isNotEmpty) {
          return null;
        } else {
          return "Enter ${widget.hintText}";
          // return null;
        }
      } : null,
    );
  }
}

