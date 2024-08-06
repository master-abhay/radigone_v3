import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final String? initialValue;
  final bool? autofocus;
  final TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  final TextCapitalization? textCapitalization;
  final Widget? icon;
  final bool? filled;
  final bool? readOnly;
  final TextInputType? textInputType;
  final dynamic leading;
  final dynamic trailing;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onTitleChanged;

  final void Function()? onTap;
  final String? errorText;
  final List<TextInputFormatter>? inputFormat;
  final InputBorder? border;
  final int? maxLines;
  final List<String>? titleOptions;
  final String? selectedTitleValue;

  CustomFormField({
    super.key,
    this.readOnly,
    this.currentFocusNode,
    this.nextFocusNode,
    this.autofocus,
    this.controller,
    this.initialValue,
    required this.obscureText,
    required this.hintText,
    this.textCapitalization,
    this.icon,
    this.filled,
    this.textInputType,
    this.leading,
    this.trailing,
    this.onSaved,
    this.onChanged,
    this.onTitleChanged,
    this.onTap,
    this.errorText,
    this.inputFormat,
    this.border,
    this.maxLines,
    this.selectedTitleValue,
    this.titleOptions,
  });

  @override
  State<CustomFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomFormField> {
  String? _selectedTitle;

  @override
  void initState() {
    super.initState();
    // _selectedTitle = widget.selectedTitle ?? widget.titleOptions.isNotEmpty ? widget.titleOptions![0] : null;
    _selectedTitle =
        widget.titleOptions != null ? widget.titleOptions![0] : null;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentPaddingHorizontal = screenWidth * 0.03;
    final hintFontSize = screenWidth * 0.04;
    final labelFontSize = screenWidth * 0.045;

    return TextFormField(
      onTap: widget.onTap,
      maxLines: widget.maxLines ?? 1,
      readOnly: widget.readOnly ?? false,
      focusNode: widget.currentFocusNode,
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      obscureText: widget.obscureText,
      textCapitalization:
          widget.textCapitalization ?? TextCapitalization.sentences,
      onSaved: widget.onSaved,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        errorText: widget.errorText,
        prefixIcon: widget.titleOptions != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: DropdownButton<String>(
                  dropdownColor: Colors.black,
                  hint: Text(
                    widget.titleOptions![0].toString(),
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                  value: widget.selectedTitleValue,
                  items: widget.titleOptions!.map((String title) {
                    return DropdownMenuItem<String>(
                      value: title,
                      child: Text(title,style:  TextStyle(color: Colors.white.withOpacity(0.9)),),
                    );
                  }).toList(),
                  onChanged: widget.onTitleChanged,
                  underline: const SizedBox(),
                  // Removes the underline of the dropdown
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                ),
              )
            : widget.leading,

        // prefixIcon: (widget.maxLines != null && widget.maxLines! > 1)
        //     ? Padding(
        //         padding: const EdgeInsets.only(bottom: 47),
        //         child: widget.leading ?? Container(),
        //       )
        //     : widget.leading,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 0,
        ),
        suffixIcon: widget.trailing,
        isDense: false,
        errorStyle: const TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(
          horizontal: contentPaddingHorizontal,
        ),
        suffix: widget.icon,
        alignLabelWithHint: true,
        hintText: widget.hintText.toLowerCase(),
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.1),
          fontSize: hintFontSize,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.amber.withOpacity(1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelText: widget.hintText,
        labelStyle: TextStyle(
          color: Colors.white.withOpacity(0.65),
          fontSize: labelFontSize,
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.3),
      ),
      inputFormatters: widget.inputFormat,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType: widget.textInputType ?? TextInputType.text,
      onFieldSubmitted: (_) {
        widget.nextFocusNode != null
            ? FocusScope.of(context).requestFocus(widget.nextFocusNode)
            : FocusScope.of(context).unfocus();
      },
      onChanged: widget.onChanged != null
          ? (value) {
              widget.onChanged!(value.trim());
            }
          : null,
    );
  }
}
