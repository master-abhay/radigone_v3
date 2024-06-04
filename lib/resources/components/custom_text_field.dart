import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final FocusNode currentFocusNode;
   FocusNode? nextFocusNode;
   bool? autofocus;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final bool isNumber;
  bool? textCapitalization;
  Widget? icon;
  int? maxLines;
  final void Function(String? value) onChanged;

  CustomTextField(
      {super.key,
      required this.currentFocusNode,
       this.nextFocusNode,
        this.autofocus,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      this.textCapitalization,
      required this.isNumber,
      this.icon,
      this.maxLines,
      required this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.currentFocusNode,
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      maxLines: widget.maxLines,
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
        fillColor: Colors.black12,
      ),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType: widget.isNumber ? TextInputType.phone : TextInputType.text,
      onSubmitted: (_) {
        widget.nextFocusNode != null ?

        FocusScope.of(context).requestFocus(widget.nextFocusNode) :FocusScope.of(context).unfocus() ;
      },
    );
  }
}
