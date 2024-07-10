import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final FocusNode currentFocusNode;
  FocusNode? nextFocusNode;
  bool? autofocus;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  bool? textCapitalization;
  TextInputType? textInputType;
  Widget? icon;
  int? maxLines;
  bool? filled;
  bool? readOnly;
  final void Function(String? value) onChanged;

  CustomTextField(
      {super.key,
      this.readOnly,
      required this.currentFocusNode,
      this.nextFocusNode,
      this.autofocus,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      this.textCapitalization,
        this.textInputType,
      this.icon,
      this.maxLines,
      this.filled,
      required this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.readOnly ?? false,
      focusNode: widget.currentFocusNode,
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      textCapitalization: widget.textCapitalization == true
          ? TextCapitalization.sentences
          : TextCapitalization.none,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.width * 0.01),
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
        filled: widget.filled ?? true,
        fillColor: Colors.black12,
      ),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType:  widget.textInputType ?? TextInputType.text,
      onSubmitted: (_) {
        widget.nextFocusNode != null
            ? FocusScope.of(context).requestFocus(widget.nextFocusNode)
            : FocusScope.of(context).unfocus();
      },
    );
  }
}
