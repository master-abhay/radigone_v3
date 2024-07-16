import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final void Function(String?) onSaved;
  final void Function(String?) onChanged;
  final List dropdownListData;
  final String hint;
  bool? doValidation;
  String? value;

  CustomDropdown(
      {super.key,
        this.value,
      required this.onSaved,
      required this.onChanged,
      required this.dropdownListData,
      required this.hint,
      this.doValidation,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonFormField(
        value: value,
        padding: EdgeInsets.zero,
        isExpanded: true,
        alignment: Alignment.center,
        dropdownColor: Colors.black.withOpacity(0.65),
        focusColor: Colors.black,

        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        items: [
          ...dropdownListData
              .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                    alignment: Alignment.centerLeft,
                    value: e['value'],
                    child: Text(
                      e['title'],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
        ],

        onChanged: onChanged,
        onSaved: onSaved,
        // validator: (value) {
        //   if (value != null && value.isNotEmpty) {
        //     return null;
        //   } else {
        //     return "Select ${widget.hint}";
        //     // return null;
        //   }
        // },
        decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.width * 0.01),
            alignLabelWithHint: true,
            hintText: hint.toLowerCase(),
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
            labelText: hint,
            labelStyle:
                TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 15),
            filled: true,
            fillColor: Colors.black.withOpacity(0.3)),
      ),
    );
  }
}
