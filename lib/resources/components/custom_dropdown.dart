import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {



 final void Function(String?) onSaved;
  final void Function(String?) onChanged;
  final List dropdownListData;
  final String hint;
  bool? doValidation;
   CustomDropdown({super.key, required this.onSaved, required this.onChanged, required this.dropdownListData, required this.hint,this.doValidation});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {



  @override
  Widget build(BuildContext context) {
    List dropdownListData = widget.dropdownListData;
    String defaultValue = "";


    return Center(
      child: DropdownButtonFormField(
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
          // const DropdownMenuItem(
          //   child: Text("Select Gender"),
          //   value: "",
          // ),
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
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
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
                horizontal: MediaQuery.of(context).size.width * 0.02),
            alignLabelWithHint: true,
            hintText: widget.hint.toLowerCase(),
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
            labelText: widget.hint,
            labelStyle:
                TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 15),
            filled: true,
            fillColor: Colors.black.withOpacity(0.3)),
      ),
    );
  }
}
