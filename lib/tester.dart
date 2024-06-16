import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:radigone_v3/resources/components/custom_input_decoration.dart';

class DependentDropdown extends StatefulWidget {
  final Map<String, List<String>> categories;
  final String? initialBusinessCategory;
  final String? initialSubCategory;
  final ValueChanged<String?>? onBusinessCategoryChanged;
  final ValueChanged<String?>? onSubCategoryChanged;
  final FormFieldSetter<String?>? onBusinessCategorySaved;
  final FormFieldSetter<String?>? onSubCategorySaved;
  final FocusNode? businessCategoryFocusNode;
  final FocusNode? subCategoryFocusNode;

  DependentDropdown({
    required this.categories,
    this.initialBusinessCategory,
    this.initialSubCategory,
    this.onBusinessCategoryChanged,
    this.onSubCategoryChanged,
    this.onBusinessCategorySaved,
    this.onSubCategorySaved,
    this.businessCategoryFocusNode,
    this.subCategoryFocusNode,
  });

  @override
  _DependentDropdownState createState() => _DependentDropdownState();
}

class _DependentDropdownState extends State<DependentDropdown> {
  String? _selectedBusinessCategory;
  String? _selectedSubCategory;
  List<String> _subCategoryList = [];
  bool _isBusinessCategoryEnabled = true; // Track if business category is enabled

  @override
  void initState() {
    super.initState();

    // Check if initial business category is provided and exists in the map
    if (widget.initialBusinessCategory != null &&
        widget.categories.containsKey(widget.initialBusinessCategory)) {
      _selectedBusinessCategory = widget.initialBusinessCategory;
      _updateSubCategoryList(_selectedBusinessCategory!);
      _isBusinessCategoryEnabled = false; // Disable business category
    } else {
      // If initial business category is empty or not in map, set to first category in map
      _selectedBusinessCategory = widget.categories.keys.first;
      _updateSubCategoryList(_selectedBusinessCategory!);
      _isBusinessCategoryEnabled = true; // Enable business category
    }

    // Set initial subcategory if provided and exists in the subcategory list
    if (widget.initialSubCategory != null &&
        _subCategoryList.contains(widget.initialSubCategory)) {
      _selectedSubCategory = widget.initialSubCategory;
    }
  }

  void _updateSubCategoryList(String selectedCategory) {
    setState(() {
      _subCategoryList = widget.categories[selectedCategory] ?? [];
      if (!_subCategoryList.contains(_selectedSubCategory)) {
        _selectedSubCategory = null; // Clear the subcategory selection if it doesn't match the selected category
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String?>(
          value: _selectedBusinessCategory,
          hint: Text('Select Business Category'),
          onChanged: _isBusinessCategoryEnabled
              ? (String? newValue) {
            setState(() {
              _selectedBusinessCategory = newValue;
              _updateSubCategoryList(newValue!);
              _selectedSubCategory = null; // Reset subcategory when business category changes
            });
            if (widget.onBusinessCategoryChanged != null) {
              widget.onBusinessCategoryChanged!(newValue);
            }
          }
              : null,
          onSaved: widget.onBusinessCategorySaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a category';
            }
            return null;
          },
          items: widget.categories.keys.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: const TextStyle(color: Colors.white),),
            );
          }).toList(),
          disabledHint: Text(_selectedBusinessCategory ?? 'Select Business Category'),
          decoration: CustomInputDecoration.getDecoration(context: context, hintText: "Business Category"),
        ),
       const  SizedBox(height: 16),
        DropdownButtonFormField<String?>(
          value: _selectedSubCategory,
          hint: const Text('Select Subcategory'),
          padding: EdgeInsets.zero,
          isExpanded: true,
          alignment: Alignment.center,
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
              child: Text(value,style: const TextStyle(color: Colors.white),),
            );
          }).toList(),
          decoration: CustomInputDecoration.getDecoration(context: context, hintText: "Business Subcategory"),

        ),
      ],
    );
  }
}




class DependentDropdownsScreen extends StatefulWidget {
  @override
  _DependentDropdownsScreenState createState() => _DependentDropdownsScreenState();
}

class _DependentDropdownsScreenState extends State<DependentDropdownsScreen> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, List<String>> _categories = {
    'Test11': ['test1', 'test2', 'test3'],
    'Online Services': ['123'],
    'OTT Platform': ['Netflix', 'HotStar', 'Prime Video', 'Other'],
    'Sports': ['Cricket', 'Football', 'Tennis', 'BasketBall', 'Hockey', 'other'],
    'Mobile and Laptops': ['456'],
    'Loans': ['Home Loan', 'Vehicle Loan', 'other'],
    'Tour and Travels': ['Tour', 'Travels'],
    'Gold and Jewellery': ['abc'],
    'Clothing': ['Men', 'Women', 'Kids'],
    'Accessories': ['Access', 'To'],
    'Real Estate': ['Commercial', 'Residential', 'Rent', 'other'],
    'Health': ['Wealth'],
    'others': ['abc'],
  };

  String? _selectedBusinessCategory;
  String? _selectedSubCategory;

  final FocusNode _businessCategoryFocusNode = FocusNode();
  final FocusNode _subCategoryFocusNode = FocusNode();

  @override
  void dispose() {
    _businessCategoryFocusNode.dispose();
    _subCategoryFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dependent Dropdowns')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DependentDropdown(
                categories: _categories,
                // initialBusinessCategory: _selectedBusinessCategory,
                initialBusinessCategory: 'Online Services',
                initialSubCategory: _selectedSubCategory,
                onBusinessCategoryChanged: (value) {
                  setState(() {
                    _selectedBusinessCategory = value;
                  });
                },
                onSubCategoryChanged: (value) {
                  setState(() {
                    _selectedSubCategory = value;
                  });
                },
                onBusinessCategorySaved: (value) {
                  _selectedBusinessCategory = value;
                },
                onSubCategorySaved: (value) {
                  _selectedSubCategory = value;
                },
                businessCategoryFocusNode: _businessCategoryFocusNode,
                subCategoryFocusNode: _subCategoryFocusNode,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form Submitted Successfully')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

