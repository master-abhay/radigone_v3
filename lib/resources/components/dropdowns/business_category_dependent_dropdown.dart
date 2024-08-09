
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/common/business_category_model.dart';
import '../custom_input_decoration.dart';

class BusinessCategoryDependentDropdown extends StatefulWidget {
  final List<Categories> categories;
  final String hintText;
  final String subDropdownHintText;
  final String? initialCategory;
  final String? initialSubCategory;
  final ValueChanged<int?>? onCategoryChanged;
  final ValueChanged<String?>? onSubCategoryChanged;
  final FocusNode? categoryFocusNode;
  final FocusNode? subCategoryFocusNode;
  final FocusNode? nextFocusNode;
  final Color? fillColor;

  const BusinessCategoryDependentDropdown({
    Key? key,
    required this.categories,
    required this.hintText,
    required this.subDropdownHintText,
    this.initialCategory,
    this.initialSubCategory,
    this.onCategoryChanged,
    this.onSubCategoryChanged,
    this.categoryFocusNode,
    this.subCategoryFocusNode,
    this.nextFocusNode,
    this.fillColor,
  }) : super(key: key);

  @override
  _BusinessCategoryDependentDropdownState createState() => _BusinessCategoryDependentDropdownState();
}

class _BusinessCategoryDependentDropdownState extends State<BusinessCategoryDependentDropdown> {
  late FocusNode _categoryFocusNode;
  late FocusNode _subCategoryFocusNode;
  late FocusNode _nextFocusNode;

  int? _selectedCategoryId;
  String? _selectedSubcategory;
  List<String> _subcategories = [];

  @override
  void initState() {
    super.initState();
    _categoryFocusNode = widget.categoryFocusNode ?? FocusNode();
    _subCategoryFocusNode = widget.subCategoryFocusNode ?? FocusNode();
    _nextFocusNode = widget.nextFocusNode ?? FocusNode();

    // Initialize BusinessCategoryDependentDropdown with initial values
    _initializeBusinessCategoryDependentDropdown();
  }

  void _initializeBusinessCategoryDependentDropdown() {
    if (widget.initialCategory != null) {
      final category = widget.categories.firstWhere(
            (cat) => cat.id == int.parse(widget.initialCategory.toString()),
        orElse: () => Categories(id: -1, name: widget.initialCategory, subcategories: ''),
      );
      _selectedCategoryId = category.id;
      _subcategories = _getSubcategories(category.id);

      // Set initial subcategory if it's valid
      if (widget.initialSubCategory != null &&
          _subcategories.contains(widget.initialSubCategory)) {
        _selectedSubcategory = widget.initialSubCategory;
      } else {
        _selectedSubcategory = null; // Reset if the initial subcategory is invalid
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final hintFontSize = screenWidth * 0.035;
    final subHintFontSize = screenWidth * 0.04;



    return Column(
      children: [
        IgnorePointer(
          ignoring: widget.initialCategory != null ? true : false,
          child: DropdownButtonFormField<int>(
            focusNode: _categoryFocusNode,
            padding: EdgeInsets.zero,
            isExpanded: true,
            dropdownColor: Colors.black,
            value: _selectedCategoryId,
            items: widget.categories.map((category) {
              return DropdownMenuItem<int>(
                value: category.id,
                child: Text(category.name ?? 'Unknown'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategoryId = value;
                _subcategories = _getSubcategories(value);
                _selectedSubcategory = null; // Reset subcategory when category changes

                //*----shifting Focus----*
                FocusScope.of(context).requestFocus(_subCategoryFocusNode);

              });
              if (widget.onCategoryChanged != null) {
                widget.onCategoryChanged!(value);
              }
            },
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            hint: Text(
              widget.initialCategory ?? widget.hintText,
              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: subHintFontSize, fontWeight: FontWeight.w500),
            ),
            style: TextStyle(color: Colors.white, fontSize: hintFontSize),
            decoration: CustomInputDecoration.getDecoration(
              context: context,
              hintText: widget.hintText,
              filled: true,
              fillColor: widget.fillColor ?? Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          focusNode: _subCategoryFocusNode,
          padding: EdgeInsets.zero,
          isExpanded: true,
          dropdownColor: Colors.black,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          hint: Text(
            widget.subDropdownHintText,
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: subHintFontSize, fontWeight: FontWeight.w500),
          ),
          style: TextStyle(color: Colors.white, fontSize: subHintFontSize),
          decoration: CustomInputDecoration.getDecoration(
            context: context,
            hintText: widget.subDropdownHintText,
            fillColor: widget.fillColor ?? Colors.black.withOpacity(0.1),
          ),
          value:  _selectedSubcategory,
          items: _subcategories.map((sub) {
            return DropdownMenuItem<String>(
              value: sub,
              child: Text(sub),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedSubcategory = value;
            });
            if (widget.onSubCategoryChanged != null) {
              widget.onSubCategoryChanged!(value);
            }
            FocusScope.of(context).requestFocus(_nextFocusNode);
          },
        ),
      ],
    );
  }

  List<String> _getSubcategories(int? categoryId) {
    if (categoryId == null) {
      return [];
    }

    final category = widget.categories.firstWhere((cat) => cat.id == categoryId);
    if (category.subcategories == null) {
      return [];
    }
    return category.subcategories!.split(',');
  }
}