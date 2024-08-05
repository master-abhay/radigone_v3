// import 'package:flutter/material.dart';
// import 'package:radigone_v3/resources/components/custom_input_decoration.dart';
//
// class DependentDropdown extends StatefulWidget {
//   final Map<String, List<String>> categories;
//   final String? initialBusinessCategory;
//   final String? initialSubCategory;
//   final ValueChanged<String?>? onBusinessCategoryChanged;
//   final ValueChanged<String?>? onSubCategoryChanged;
//   final FormFieldSetter<String?>? onBusinessCategorySaved;
//   final FormFieldSetter<String?>? onSubCategorySaved;
//   final FocusNode? businessCategoryFocusNode;
//   final FocusNode? subCategoryFocusNode;
//   final FocusNode? nextFocusNode;
//
//   DependentDropdown({
//     required this.categories,
//     this.initialBusinessCategory,
//     this.initialSubCategory,
//     this.onBusinessCategoryChanged,
//     this.onSubCategoryChanged,
//     this.onBusinessCategorySaved,
//     this.onSubCategorySaved,
//     this.businessCategoryFocusNode,
//     this.subCategoryFocusNode,
//     this.nextFocusNode,
//   });
//
//   @override
//   _DependentDropdownState createState() => _DependentDropdownState();
// }
//
// class _DependentDropdownState extends State<DependentDropdown> {
//   String? _selectedBusinessCategory;
//   String? _selectedSubCategory;
//   List<String> _subCategoryList = [];
//   bool _isBusinessCategoryEnabled =
//       true; // Track if business category is enabled
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Check if initial business category is provided and exists in the map
//     if (widget.initialBusinessCategory != null &&
//         widget.categories.containsKey(widget.initialBusinessCategory)) {
//       _selectedBusinessCategory = widget.initialBusinessCategory;
//       _updateSubCategoryList(_selectedBusinessCategory!);
//       _isBusinessCategoryEnabled = false; // Disable business category
//     } else {
//       // If initial business category is empty or not in map, set to first category in map
//       _selectedBusinessCategory = widget.categories.keys.first;
//       _updateSubCategoryList(_selectedBusinessCategory!);
//       _isBusinessCategoryEnabled = true; // Enable business category
//     }
//
//     // Set initial subcategory if provided and exists in the subcategory list
//     if (widget.initialSubCategory != null &&
//         _subCategoryList.contains(widget.initialSubCategory)) {
//       _selectedSubCategory = widget.initialSubCategory;
//     }
//   }
//
//   void _updateSubCategoryList(String selectedCategory) {
//     setState(() {
//       _subCategoryList = widget.categories[selectedCategory] ?? [];
//       if (!_subCategoryList.contains(_selectedSubCategory)) {
//         _selectedSubCategory =
//             null; // Clear the subcategory selection if it doesn't match the selected category
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DropdownButtonFormField<String?>(
//           value: _selectedBusinessCategory,
//           hint: const Text(
//             'Select Business Category',
//             style: TextStyle(color: Colors.white),
//           ),
//           padding: EdgeInsets.zero,
//           isExpanded: true,
//           alignment: Alignment.center,
//           dropdownColor: Colors.black.withOpacity(0.65),
//           focusColor: Colors.black,
//           onChanged: _isBusinessCategoryEnabled
//               ? (String? newValue) {
//                   setState(() {
//                     _selectedBusinessCategory = newValue;
//                     _updateSubCategoryList(newValue!);
//                     _selectedSubCategory =
//                         null; // Reset subcategory when business category changes
//                   });
//                   if (widget.onBusinessCategoryChanged != null) {
//                     widget.onBusinessCategoryChanged!(newValue);
//                   }
//                   widget.businessCategoryFocusNode != null
//                       ? Focus.of(context)
//                           .requestFocus(widget.subCategoryFocusNode)
//                       : null;
//                 }
//               : null,
//           onSaved: widget.onBusinessCategorySaved,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please select a category';
//             }
//             return null;
//           },
//           items: widget.categories.keys
//               .map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(
//                 value,
//                 style: const TextStyle(color: Colors.white),
//               ),
//             );
//           }).toList(),
//           disabledHint: Text(
//             _selectedBusinessCategory ?? 'Select Business Category',
//             style: const TextStyle(color: Colors.white),
//           ),
//           decoration: CustomInputDecoration.getDecoration(
//             context: context,
//             hintText: "Business Category",
//           ),
//         ),
//         const SizedBox(height: 16),
//         DropdownButtonFormField<String?>(
//           value: _selectedSubCategory,
//           hint: const Text(
//             'Select Subcategory',
//             style: TextStyle(color: Colors.white),
//           ),
//           padding: EdgeInsets.zero,
//           isExpanded: true,
//           dropdownColor: Colors.black.withOpacity(0.65),
//           focusColor: Colors.black,
//           onChanged: _subCategoryList.isEmpty
//               ? null
//               : (String? newValue) {
//                   setState(() {
//                     _selectedSubCategory = newValue;
//                   });
//                   if (widget.onSubCategoryChanged != null) {
//                     widget.onSubCategoryChanged!(newValue);
//                   }
//                   widget.nextFocusNode != null
//                       ? Focus.of(context).requestFocus(widget.nextFocusNode)
//                       : null;
//                 },
//           onSaved: widget.onSubCategorySaved,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please select a subcategory';
//             }
//             return null;
//           },
//           items: _subCategoryList.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(
//                 value,
//                 style: const TextStyle(color: Colors.white),
//               ),
//             );
//           }).toList(),
//           decoration: CustomInputDecoration.getDecoration(
//               context: context, hintText: "Business Subcategory"),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:radigone_v3/resources/components/custom_input_decoration.dart';

class DependentDropdown extends StatefulWidget {
  final Map<String, List<String>> categories;
  final String? initialCategory;
  final String? initialSubCategory;
  final ValueChanged<String?>? onCategoryChanged;
  final ValueChanged<String?>? onSubCategoryChanged;
  final FormFieldSetter<String?>? onCategorySaved;
  final FormFieldSetter<String?>? onSubCategorySaved;
  final FocusNode? categoryFocusNode;
  final FocusNode? subCategoryFocusNode;
  final FocusNode? nextFocusNode;

  DependentDropdown({
    required this.categories,
    this.initialCategory,
    this.initialSubCategory,
    this.onCategoryChanged,
    this.onSubCategoryChanged,
    this.onCategorySaved,
    this.onSubCategorySaved,
    this.categoryFocusNode,
    this.subCategoryFocusNode,
    this.nextFocusNode,
  });

  @override
  _DependentDropdownState createState() => _DependentDropdownState();
}

class _DependentDropdownState extends State<DependentDropdown> {
  String? _selectedCategory;
  String? _selectedSubCategory;
  List<String> _subCategoryList = [];
  bool _isCategoryEnabled = true; // Track if category dropdown is enabled

  @override
  void initState() {
    super.initState();

    // Set initial category and subcategory
    if (widget.initialCategory != null &&
        widget.categories.containsKey(widget.initialCategory)) {
      _selectedCategory = widget.initialCategory;
      _updateSubCategoryList(_selectedCategory!);
      _isCategoryEnabled = false; // Disable category dropdown if initial value is set
    } else {
      _selectedCategory = widget.categories.keys.first;
      _updateSubCategoryList(_selectedCategory!);
      _isCategoryEnabled = true;
    }

    if (widget.initialSubCategory != null &&
        _subCategoryList.contains(widget.initialSubCategory)) {
      _selectedSubCategory = widget.initialSubCategory;
    }
  }

  void _updateSubCategoryList(String selectedCategory) {
    setState(() {
      _subCategoryList = widget.categories[selectedCategory] ?? [];
      if (!_subCategoryList.contains(_selectedSubCategory)) {
        _selectedSubCategory = null; // Clear subcategory if it doesn't match the selected category
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String?>(
          value: _selectedCategory,
          hint: const Text(
            'Select Category',
            style: TextStyle(color: Colors.white),
          ),
          padding: EdgeInsets.zero,
          isExpanded: true,
          alignment: Alignment.center,
          dropdownColor: Colors.black.withOpacity(0.65),
          focusColor: Colors.black,
          onChanged: _isCategoryEnabled
              ? (String? newValue) {
            setState(() {
              _selectedCategory = newValue;
              _updateSubCategoryList(newValue!);
              _selectedSubCategory = null; // Reset subcategory when category changes
            });
            if (widget.onCategoryChanged != null) {
              widget.onCategoryChanged!(newValue);
            }
            widget.categoryFocusNode != null
                ? Focus.of(context).requestFocus(widget.subCategoryFocusNode)
                : null;
          }
              : null,
          onSaved: widget.onCategorySaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a category';
            }
            return null;
          },
          items: widget.categories.keys
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          disabledHint: Text(
            _selectedCategory ?? 'Select Category',
            style: const TextStyle(color: Colors.white),
          ),
          decoration: CustomInputDecoration.getDecoration(
            context: context,
            hintText: "Category",
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String?>(
          value: _selectedSubCategory,
          hint: const Text(
            'Select Subcategory',
            style: TextStyle(color: Colors.white),
          ),
          padding: EdgeInsets.zero,
          isExpanded: true,
          dropdownColor: Colors.black.withOpacity(0.65),
          focusColor: Colors.black,
          onChanged: _subCategoryList.isEmpty
              ? null
              : (String? newValue) {
            setState(() {
              _selectedSubCategory = newValue;
            });
            if (widget.onSubCategoryChanged != null) {
              widget.onSubCategoryChanged!(newValue);
            }
            widget.nextFocusNode != null
                ? Focus.of(context).requestFocus(widget.nextFocusNode)
                : null;
          },
          onSaved: widget.onSubCategorySaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a subcategory';
            }
            return null;
          },
          items: _subCategoryList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          decoration: CustomInputDecoration.getDecoration(
              context: context, hintText: "Subcategory"),
        ),
      ],
    );
  }
}

