import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/utils.dart';

// class CustomFormField extends StatefulWidget {
//   final bool isNumber;
//   final String hintText;
//   final bool obscureText;
//   bool? textCapitalization;
//   Widget? icon;
//   int? maxLines;
//   String? initialValue;
//   bool? doValidation;
//   final void Function(String? value) onSaved;
//   TextEditingController? textEditingController;
//   FocusNode? focusNode;
//   FocusNode? nextFocusNode;
//
//   CustomFormField(
//       {super.key,
//       required this.hintText,
//       required this.onSaved,
//       required this.obscureText,
//       required this.isNumber,
//       this.icon,
//       this.maxLines,
//         this.textCapitalization,
//         this.initialValue,
//         this.doValidation,
//         this.textEditingController,
//         this.focusNode
//       });
//
//   @override
//   State<CustomFormField> createState() => _CustomFormFieldState();
// }
//
// class _CustomFormFieldState extends State<CustomFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//
//       focusNode: widget.focusNode,
//       controller: widget.textEditingController,
//       obscureText: widget.obscureText,
//       onSaved: widget.onSaved,
//       autofocus: false,
//       obscuringCharacter: '*',
//       textAlign: TextAlign.justify,
//       textCapitalization: widget.textCapitalization == true ? TextCapitalization.sentences : TextCapitalization.none,
//       initialValue: widget.initialValue,
//
//       decoration: InputDecoration(
//           errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.02),
//           suffix: widget.icon,
//           alignLabelWithHint: true,
//           hintText: widget.hintText.toLowerCase(),
//           hintFadeDuration: const Duration(milliseconds: 500),
//           hintStyle:
//               TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 15),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Colors.white)),
//           errorBorder: UnderlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.red.withOpacity(0.8))),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.black.withOpacity(0.3))),
//           focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Colors.white)),
//           labelText: widget.hintText,
//           labelStyle:
//               TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 15),
//           filled: true,
//           fillColor: Colors.black.withOpacity(0.3),
//
//       ),
//       cursorColor: Colors.white,
//       style: const TextStyle(color: Colors.white),
//       keyboardType: widget.isNumber ? TextInputType.phone : TextInputType.text,
//       validator:  widget.doValidation == null ?  (value) {
//         if (value != null && value.isNotEmpty) {
//           return null;
//         } else {
//           return "Enter ${widget.hintText}";
//           // return null;
//         }
//       } : null,
//       onFieldSubmitted: (_){
//         FocusScope.of(context).unfocus();
//       },
//
//     );
//   }
// }




class CustomFormField extends StatefulWidget {
   FocusNode? currentFocusNode;
  FocusNode? nextFocusNode;
    String? initialValue;
  bool? autofocus;
   TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  TextCapitalization? textCapitalization;
  Widget? icon;
  bool? filled;
  bool? readOnly;
  TextInputType? textInputType;
  dynamic leading;
  dynamic trailing;
   void Function(String? value)? onSaved;
   void Function(String? value)? onChanged;
  void Function()? onTap;
  String? errorText;
  List<TextInputFormatter>? inputFormat;
  InputBorder? border;
  int? maxLines;


  CustomFormField(
      {super.key,
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
        this.onTap,
        this.errorText,
        this.inputFormat,
        this.border,
        this.maxLines});

  @override
  State<CustomFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomFormField>
    with MediaQueryMixin<CustomFormField> {
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      onTap: widget.onTap,
      maxLines: widget.maxLines ?? 1,
      readOnly: widget.readOnly ?? false,
      focusNode: widget.currentFocusNode,
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      obscureText: widget.obscureText,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.sentences,
      onSaved: widget.onSaved,
      initialValue: widget.initialValue,

      // decoration: InputDecoration(
      //   errorText: widget.errorText,
      //   contentPadding: EdgeInsets.symmetric(
      //     vertical: screenWidth * 0.03,
      //     horizontal: widget.leading == null ? screenWidth * 0.03 : 0,
      //   ),
      //   prefixIcon: (widget.maxLines != null && widget.maxLines! > 1)
      //       ? Padding(
      //       padding: const EdgeInsets.only(bottom: 47),
      //       child: widget.leading ?? Container())
      //       : widget.leading,
      //
      //   // add a default widget if leading is null
      //   prefixIconConstraints: const BoxConstraints(
      //     minWidth: 30,
      //     minHeight: 0,
      //   ),
      //   suffix: widget.icon,
      //   suffixIcon: widget.trailing,
      //   // isCollapsed: true,
      //   isDense: true,
      //   alignLabelWithHint: true,
      //   hintText: widget.hintText,
      //   hintFadeDuration: const Duration(milliseconds: 500),
      //   hintStyle:
      //   const TextStyle(color: AppColors.hintDarkGrey, fontSize: 14),
      //   border: widget.border ??
      //       const UnderlineInputBorder(
      //           borderRadius: BorderRadius.zero,
      //           borderSide: BorderSide(color: AppColors.darkGrey)),
      //   focusedBorder: widget.border ??
      //       const UnderlineInputBorder(
      //           borderRadius: BorderRadius.zero,
      //           borderSide: BorderSide(color: AppColors.darkGrey)),
      //   errorBorder: widget.border ??
      //       const UnderlineInputBorder(
      //           borderRadius: BorderRadius.zero,
      //           borderSide: BorderSide(color: Colors.red)),
      //   enabledBorder: widget.border ??
      //       const UnderlineInputBorder(
      //           borderRadius: BorderRadius.zero,
      //           borderSide: BorderSide(color: AppColors.darkGrey)),
      //   focusedErrorBorder: widget.border ??
      //       const UnderlineInputBorder(
      //           borderRadius: BorderRadius.zero,
      //           borderSide: BorderSide(color: AppColors.darkGrey)),
      // ),

      decoration: InputDecoration(
          errorText: widget.errorText,

          prefixIcon: (widget.maxLines != null && widget.maxLines! > 1)
              ? Padding(
              padding: const EdgeInsets.only(bottom: 47),
              child: widget.leading ?? Container())
              : widget.leading,

          // add a default widget if leading is null
          prefixIconConstraints: const BoxConstraints(
            minWidth: 30,
            minHeight: 0,
          ),
          suffixIcon: widget.trailing,
          // isCollapsed: true,
          isDense: false,
      errorStyle:const  TextStyle(color: Colors.white),
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
            borderSide: BorderSide(color: Colors.amber.withOpacity(1))),
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

      inputFormatters: widget.inputFormat,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      keyboardType: widget.textInputType ?? TextInputType.text,
      onFieldSubmitted: (_) {
        widget.nextFocusNode != null
            ? FocusScope.of(context).requestFocus(widget.nextFocusNode)
            : FocusScope.of(context).unfocus();
      },

      onChanged:widget.onChanged != null ? (value) {
        widget.onChanged!(value.trim());
      } : null ,
    );
  }
}
