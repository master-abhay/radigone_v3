import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneFormInputField extends StatefulWidget {

  final String hintText;
  String? initialValue;
  bool? enabled;
  final void Function(PhoneNumber? value) onSaved;
  final void Function(PhoneNumber? value) onChanged;


   CustomPhoneFormInputField({super.key, required this.hintText, required this.onSaved, required this.onChanged, this.initialValue,this.enabled});

  @override
  State<CustomPhoneFormInputField> createState() => _CustomPhoneFormInputFieldState();
}

class _CustomPhoneFormInputFieldState extends State<CustomPhoneFormInputField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      enabled: widget.enabled ?? false,

      onSaved: widget.onSaved,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      dropdownTextStyle: const TextStyle(color: Colors.white),
      dropdownIcon: const Icon(Icons.arrow_drop_down,color: Colors.white,),
      disableLengthCheck: false,
      initialCountryCode: 'IN',
      initialValue: widget.initialValue,


      validator: (value) {
        if (value != null && value.isValidNumber()) {
          return null;
        } else {
          return "Enter valid ${widget.hintText}";
          // return null;
        }
      },
      onChanged: widget.onChanged,

      decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
          contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          // suffix: widget.icon,
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
          fillColor: Colors.black.withOpacity(0.3)),
    );
  }
}
