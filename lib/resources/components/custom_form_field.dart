import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final bool isNumber;
  final String hintText;
  final bool obscureText;
  bool? textCapitalization;
  Widget? icon;
  int? maxLines;
  String? initialValue;
  bool? doValidation;
  final void Function(String? value) onSaved;
  TextEditingController? textEditingController;

  CustomFormField(
      {super.key,
      required this.hintText,
      required this.onSaved,
      required this.obscureText,
      required this.isNumber,
      this.icon,
      this.maxLines,
        this.textCapitalization,
        this.initialValue,
        this.doValidation,
        this.textEditingController
      });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: widget.textEditingController,
      obscureText: widget.obscureText,
      onSaved: widget.onSaved,
      autofocus: false,
      obscuringCharacter: '*',
      textAlign: TextAlign.justify,
      textCapitalization: widget.textCapitalization == true ? TextCapitalization.sentences : TextCapitalization.none,
      initialValue: widget.initialValue,
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
      validator:  widget.doValidation == null ?  (value) {
        if (value != null && value.isNotEmpty) {
          return null;
        } else {
          return "Enter ${widget.hintText}";
          // return null;
        }
      } : null,
      // onFieldSubmitted: (_){
      //   FocusScope.of(context).nextFocus();
      // },

    );
  }
}
