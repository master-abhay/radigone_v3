
import 'package:flutter/material.dart';


class SingleDropdown extends StatelessWidget {
  final dynamic leading;
  final List<String> dropdownListData;
  final void Function(String?)? onChanged;
  final String? selectedValue;
  final Color? fillColor;
  final InputBorder? border;
  final String hintText;
  final String labelText;
  final FocusNode? focusNode;
  final FormFieldSetter<String?>? onSaved;
  final FormFieldValidator<String?>? validator;
  final bool? ignore;

  SingleDropdown({
    Key? key,
    this.leading,
    required this.dropdownListData,
    this.onChanged,
    this.selectedValue,
    this.fillColor,
    required this.hintText,
    required this.labelText,
    this.border,
    this.focusNode,
    this.onSaved,
    this.validator,
    this.ignore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final contentPaddingHorizontal = screenWidth * 0.02;
    final contentPaddingVertical = screenWidth * 0.01;
    final fontSize = screenWidth * 0.04;
    final labelFontSize = screenWidth * 0.045;

    return IgnorePointer(
      ignoring: ignore ?? false,
      child: DropdownButtonFormField<String?>(
        focusNode: focusNode,
        value: selectedValue,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        dropdownColor: Colors.black.withOpacity(0.65),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        items: dropdownListData.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          );
        }).toList(),
        style: TextStyle(color: Colors.white, fontSize: fontSize),
        hint: Text(
          hintText.isNotEmpty ? hintText : dropdownListData.isNotEmpty ? dropdownListData[0] : '',
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: fontSize, fontWeight: FontWeight.w500),
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red.withOpacity(0.8)),
          contentPadding: EdgeInsets.symmetric(
            horizontal: contentPaddingHorizontal,
            vertical: contentPaddingVertical,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: BorderSide(color: Colors.red.withOpacity(0.8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: BorderSide(color: Colors.black.withOpacity(0.65)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: const BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: fillColor ?? Colors.black.withOpacity(0.3),
          prefixIcon: leading != null
              ? Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: leading,
          )
              : null,
          prefixIconConstraints: BoxConstraints(
            minWidth: screenWidth * 0.08,
            minHeight: 0,
          ),
          label: Text(
            labelText,
            style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: labelFontSize),
          ),
          enabled: true,
        ),
      ),
    );
  }
}
