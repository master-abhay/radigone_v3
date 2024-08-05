import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../utils/utils.dart';
//
// class CustomDropdown extends StatelessWidget {
//   final void Function(String?) onSaved;
//   final void Function(String?) onChanged;
//   final List dropdownListData;
//   final String hint;
//   bool? doValidation;
//   String? value;
//
//   CustomDropdown(
//       {super.key,
//         this.value,
//       required this.onSaved,
//       required this.onChanged,
//       required this.dropdownListData,
//       required this.hint,
//       this.doValidation,});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: DropdownButtonFormField(
//         value: value,
//         padding: EdgeInsets.zero,
//         isExpanded: true,
//         alignment: Alignment.center,
//         dropdownColor: Colors.black.withOpacity(0.65),
//         focusColor: Colors.black,
//
//         icon: const Icon(
//           Icons.arrow_drop_down,
//           color: Colors.white,
//         ),
//         items: [
//           ...dropdownListData
//               .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
//                     alignment: Alignment.centerLeft,
//                     value: e['value'],
//                     child: Text(
//                       e['title'],
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ))
//         ],
//
//         onChanged: onChanged,
//         onSaved: onSaved,
//         // validator: (value) {
//         //   if (value != null && value.isNotEmpty) {
//         //     return null;
//         //   } else {
//         //     return "Select ${widget.hint}";
//         //     // return null;
//         //   }
//         // },
//         decoration: InputDecoration(
//             errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
//             contentPadding: EdgeInsets.symmetric(
//                 horizontal: MediaQuery.of(context).size.width * 0.02,
//                 vertical: MediaQuery.of(context).size.width * 0.01),
//             alignLabelWithHint: true,
//             hintText: hint.toLowerCase(),
//             hintFadeDuration: const Duration(milliseconds: 500),
//             hintStyle:
//                 TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 15),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide.none),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: const BorderSide(color: Colors.white)),
//             errorBorder: UnderlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.red.withOpacity(0.8))),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: Colors.black.withOpacity(0.3))),
//             focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: const BorderSide(color: Colors.white)),
//             labelText: hint,
//             labelStyle:
//                 TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 15),
//             filled: true,
//             fillColor: Colors.black.withOpacity(0.3)),
//       ),
//     );
//   }
// }


//
// class CustomDropdown extends StatefulWidget {
//   dynamic leading;
//
//   // final List<String> genderList;
//   // final List<DropdownMenuItem> menuItemsList;
//
//     final List dropdownListData;
//
//
//   // final List<dynamic> menuList;
//   void Function(dynamic value)? onSaved;
//
//   final void Function(dynamic value) onChanged;
//   final FocusNode currentFocusNode;
//   Color? fillColor;
//   InputBorder? border;
//   BorderRadiusGeometry? borderRadius;
//   String? hintText;
//
//   CustomDropdown({
//     super.key,
//     this.leading,
//     required this.dropdownListData, // required this.menuList,
//     required this.onChanged,
//     this.onSaved,
//     required this.currentFocusNode,
//     this.fillColor,
//     this.hintText,
//     this.border,
//     this.borderRadius,
//   });
//
//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }
//
// class _CustomDropdownState extends State<CustomDropdown>
//     with MediaQueryMixin<CustomDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//
//       dropdownColor: Colors.black.withOpacity(0.65),
//       focusColor: Colors.black,
//
//       icon: const Icon(
//         Icons.arrow_drop_down,
//         color: Colors.white,
//       ),
//               items: [
//           ...widget.dropdownListData
//               .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
//                     alignment: Alignment.centerLeft,
//                     value: e['value'],
//                     child: Text(
//                       e['value'],
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ))
//         ],
//
//       onChanged: widget.onChanged,
//       focusNode: widget.currentFocusNode,
//       onSaved: widget.onSaved,
//       decoration: InputDecoration(
//           errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.02,
//               vertical: MediaQuery.of(context).size.width * 0.01),
//           alignLabelWithHint: true,
//           hintText: widget.hintText!.toLowerCase(),
//           hintFadeDuration: const Duration(milliseconds: 500),
//           hintStyle:
//           TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 15),
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
//           TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 15),
//           filled: true,
//           fillColor: Colors.black.withOpacity(0.3)),
//
//       // decoration: InputDecoration(
//       //   contentPadding: EdgeInsets.symmetric(
//       //       vertical: screenWidth * 0.03,
//       //       horizontal: widget.leading == null ? screenWidth * 0.03 : 0),
//       //   prefixIcon: widget.leading,
//       //   prefixIconConstraints: const BoxConstraints(
//       //     minWidth: 30,
//       //     minHeight: 0,
//       //   ),
//       //   isDense: true,
//       //   alignLabelWithHint: true,
//       //   hintText: widget.hintText,
//       //   hintFadeDuration: const Duration(milliseconds: 500),
//       //   hintStyle: const TextStyle(color: AppColors.hintDarkGrey, fontSize: 14),
//       //   border: widget.border ??
//       //       const UnderlineInputBorder(
//       //           borderRadius: BorderRadius.zero,
//       //           borderSide: BorderSide(color: AppColors.darkGrey)),
//       //   focusedBorder: widget.border ??
//       //       const UnderlineInputBorder(
//       //           borderRadius: BorderRadius.zero,
//       //           borderSide: BorderSide(color: AppColors.darkGrey)),
//       //   errorBorder: widget.border ??
//       //       const UnderlineInputBorder(
//       //           borderRadius: BorderRadius.zero,
//       //           borderSide: BorderSide(color: Colors.red)),
//       //   enabledBorder: widget.border ??
//       //       const UnderlineInputBorder(
//       //           borderRadius: BorderRadius.zero,
//       //           borderSide: BorderSide(color: AppColors.darkGrey)),
//       //   focusedErrorBorder: widget.border ??
//       //       const UnderlineInputBorder(
//       //           borderRadius: BorderRadius.zero,
//       //           borderSide: BorderSide(color: AppColors.darkGrey)),
//       // ),
//
//       // cursorColor: AppColors.darkGrey,
//       style: const TextStyle(color: Colors.white),
//       padding: EdgeInsets.zero,
//       hint: Text(
//         widget.hintText ?? widget.dropdownListData[0].value.toString(),
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//
//
//       // keyboardType: widget.textInputType ?? TextInputType.text,
//     );
//   }
// }

import 'package:flutter/material.dart';

class SingleDropdown extends StatelessWidget {
  final dynamic leading;
  final List<String> dropdownListData; // Updated to List<String>
  final void Function(String?)? onChanged;
  final String? selectedValue;
  final Color? fillColor;
  final InputBorder? border;
  final String? hintText;
  final FocusNode? focusNode;
  final FormFieldSetter<String?>? onSaved;
  final FormFieldValidator<String?>? validator;

  SingleDropdown({
    Key? key,
    this.leading,
    required this.dropdownListData,
    this.onChanged,
    this.selectedValue,
    this.fillColor,
    this.hintText,
    this.border,
    this.focusNode,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String?>(
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
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.red.withOpacity(0.8)),
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.01,
        ),
        hintText: hintText ?? dropdownListData[0],
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red.withOpacity(0.8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(color: Colors.black.withOpacity(0.65)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: fillColor ?? Colors.black.withOpacity(0.3),
        prefixIcon: leading != null
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: leading,
        )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 0,
        ),
      ),
    );
  }
}
