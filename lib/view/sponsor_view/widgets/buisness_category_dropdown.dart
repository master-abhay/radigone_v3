// // import 'package:flutter/material.dart';
// // import 'package:snippet_coder_utils/FormHelper.dart';
// //
// // class BusinessCategoryDropdown extends StatefulWidget {
// //
// //
// //
// //    BusinessCategoryDropdown({Key? key}) : super(key: key);
// //
// //   @override
// //   State<BusinessCategoryDropdown> createState() => _BusinessCategoryDropdownState();
// // }
// //
// // class _BusinessCategoryDropdownState extends State<BusinessCategoryDropdown> {
// //   List<dynamic> countries = [];
// //   List<dynamic> stateMasters = [];
// //   List<dynamic> states = [];
// //   String? countryId;
// //   String? stateId;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     countries.add({"id": 1, 'label': 'IN'});
// //     countries.add({"id": 2, 'label': 'UAE'});
// //
// //     stateMasters = [
// //       {"id": 1, 'Name': 'Assam', 'parentId': 1},
// //       {"id": 2, 'Name': 'HP', 'parentId': 1},
// //       {"id": 3, 'Name': 'Delhi', 'parentId': 1},
// //       {"id": 4, 'Name': 'Punjab', 'parentId': 1},
// //       {"id": 5, 'Name': 'Delhi', 'parentId': 1},
// //       {"id": 6, 'Name': 'Abu Dhabi', 'parentId': 2},
// //       {"id": 7, 'Name': 'Dubai', 'parentId': 2},
// //       {"id": 8, 'Name': 'Sharjahan', 'parentId': 2},
// //       {"id": 9, 'Name': 'Ajman', 'parentId': 2},
// //     ];
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return  Column(
// //           children: [
// //             SizedBox(
// //               width: 295,
// //               child: Container(
// //                 child: FormHelper.dropDownWidget(
// //                   context,
// //                   'Select Country',
// //                   hintColor: Colors.white,
// //                   countryId,
// //                   countries,
// //                       (value) {
// //                     setState(() {
// //                       countryId = value.toString();
// //                       print("Selected country ID: $countryId");
// //
// //                       var selectedCountry = countries.firstWhere(
// //                               (stateItem) => stateItem['id'].toString() == countryId,
// //                           orElse: () => null);
// //                       if (selectedCountry != null) {
// //                         print("Selected country: ${selectedCountry['label']}");
// //                       }
// //
// //                       states = stateMasters
// //                           .where((stateItem) =>
// //                       stateItem['parentId'].toString() == countryId)
// //                           .toList();
// //
// //                       stateId = null;
// //                     });
// //                   },
// //                       (onValidateValue) {
// //                     if (onValidateValue == null) {
// //                       return "Select Country";
// //                     } else {
// //                       return null;
// //                     }
// //                   },
// //                   optionValue: 'id',
// //                   optionLabel: 'label',
// //                   borderColor: Colors.black,
// //                   borderFocusColor: Colors.white,
// //                   textColor: Colors.white,
// //                   borderRadius: 10,
// //                   paddingLeft: 0,
// //                   paddingRight: 0,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 10,
// //             ),
// //             SizedBox(
// //               width: 295,
// //               child: Container(
// //                 child: FormHelper.dropDownWidget(
// //                   context,
// //                   "Select State",
// //                   stateId,
// //                   states,
// //                       (onChangedvalue) {
// //                     setState(() {
// //                       stateId = onChangedvalue.toString();
// //                       var selectedState = states.firstWhere(
// //                               (stateItem) => stateItem['id'].toString() == stateId,
// //                           orElse: () => null);
// //                       if (selectedState != null) {
// //                         print("Selected State: ${selectedState['Name']}");
// //                       }
// //                     });
// //                   },
// //                       (onValidatevalue) {
// //                     return null;
// //                   },
// //                   optionValue: "id",
// //                   optionLabel: "Name",
// //                   borderColor: Colors.black,
// //                   borderFocusColor: Colors.white,
// //                   textColor: Colors.white,
// //                   hintColor: Colors.white,
// //                   borderRadius: 10,
// //                   paddingRight: 0,
// //                   paddingLeft: 0,
// //                 ),
// //               ),
// //             ),
// //           ],
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// class BusinessCategoryDropdown extends StatefulWidget {
//   const BusinessCategoryDropdown({super.key});
//
//   @override
//   State<BusinessCategoryDropdown> createState() =>
//       _BusinessCategoryDropdownState();
// }
//
// class _BusinessCategoryDropdownState extends State<BusinessCategoryDropdown> {
//   String _selectedCountry = 'India';
//   var country = {'India': 'IN', 'Bangla Desh': '"BD'};
//   List _countries = [];
//
//   void CountryDependentDropdown() {
//     country.forEach((key, value) {
//       _countries.add(key);
//     });
//     _selectedState = _state[0];
//   }
//
//   String _selectedState = '';
//   var state = {
//     'HP': 'IN',
//     'punjab': 'IN',
//     'Hariyana': 'IN',
//     'Dhaka': 'BD',
//     'Janakpur': 'BD'
//   };
//   List _state = [];
//
//   void stateDependentDropdown(countryShorName) {
//     country.forEach((key, value) {
//       if (countryShorName == value) {
//         _state.add(key);
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     super.initState();
//     CountryDependentDropdown();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           DropdownButtonFormField(
//               value: _selectedCountry,
//               items: _countries.map((country) {
//                 return DropdownMenuItem(
//                   child: Text(country),
//                   value: country,
//                 );
//               }).toList(),
//               onChanged: (newValue) {
//                 print("Printing the new Value $newValue");
//                 setState(() {
//                   stateDependentDropdown(country[newValue]);
//                   _selectedCountry = newValue as String;
//                 });
//               }),
//
//
//           DropdownButtonFormField(
//               value: _selectedState,
//               items: _state.map((state) {
//                 return DropdownMenuItem(
//                   child: Text(state),
//                   value: state,
//                 );
//               }).toList(),
//               onChanged: (newValue) {
//                 print("Printing the new Value $newValue");
//                 setState(() {
//                   _selectedState = newValue as String;
//                 });
//               })
//         ],
//       ),
//     ));
//   }
// }




import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BusinessCategoryDropdown extends StatefulWidget {


  const BusinessCategoryDropdown({super.key});

  @override
  State<BusinessCategoryDropdown> createState() =>
      _BusinessCategoryDropdownState();
}

class _BusinessCategoryDropdownState extends State<BusinessCategoryDropdown> {
  String _selectedBuisnessCategory = 'Test11';
  var buisnessCategoryMap = {
    'Test11': 'Test11',
    'Online Services': 'Online Services',
    'OTT Platform': 'OTT Platform',
    'Sports': "Sports",
    'Mobile and Laptops': 'Mobile and Laptops',
    'Loans': 'Loans',
    'Tour and Travels': 'Tour and Travels',
    'Gold and Jewellery': 'Gold and Jewellery',
    'Clothing': 'Clothing',
    'Accessories': 'Accessories',
    'Real Estate': 'Real Estate',
    'Health': "Health",
    'others': 'others'
  };
  final List<String> _buisnessCategoryList = [];

  String _selectedSubCategory = '';
  var subCategoryMap = {
    'test1': 'Test11',
    'test2': 'Test11',
    'test3': 'Test11',
    '123': 'Online Services',
    "Netflix": 'OTT Platform',
    "HotStar": 'OTT Platform',
    "Prime Video": 'OTT Platform',
    "Other": 'OTT Platform',
    'Cricket': "Sports",
    'Football': "Sports",
    'Tennis': "Sports",
    'BasketBall': "Sports",
    'Hockey': "Sports",
    'other': "Sports",
    '456': 'Mobile and Laptops',
    'Home Loan': 'Loans',
    'Vehicle Loan': 'Loans',
    "other": 'Loans',
    'Tour': 'Tour and Travels',
    'Travels': 'Tour and Travels',
    'abc': 'Gold and Jewellery',
    'Men': 'Clothing',
    'Women': 'Clothing',
    'Kids': 'Clothing',
    'Access': 'Accessories',
    'To': 'Accessories',
    'Commercial': 'Real Estate',
    'Residential': 'Real Estate',
    'Rent': 'Real Estate',
    'other': 'Real Estate',
    'Wealth': "Health",
    'abc': "others"
  };
  final List<String> _subCategoryList = [];

  @override
  void initState() {
    super.initState();
    BuisnessDependentDropdown();
    stateDependentDropdown(buisnessCategoryMap[_selectedSubCategory]);
  }

  void BuisnessDependentDropdown() {
    buisnessCategoryMap.forEach((key, value) {
      _buisnessCategoryList.add(key);
    });
  }

  void stateDependentDropdown(String? categoryShortName) {
    _subCategoryList.clear(); // Clear previous states
    subCategoryMap.forEach((key, value) {
      if (categoryShortName == value) {
        _subCategoryList.add(key);
      }
    });
    // Select the first state if available
    _selectedSubCategory =
        _subCategoryList.isNotEmpty ? _subCategoryList[0] : '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedBuisnessCategory.isNotEmpty
                  ? _selectedBuisnessCategory
                  : null,
              items: _buisnessCategoryList.map((element) {
                return DropdownMenuItem(
                  value: element,
                  child: Text(
                    element,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedBuisnessCategory = newValue!;
                  if(kDebugMode){
                    print("--------printing the Buisness Category $_selectedBuisnessCategory");
                  }
                  stateDependentDropdown(
                      buisnessCategoryMap[_selectedBuisnessCategory]);
                });
              },
              hint: Text("select Cat..".toLowerCase()),
              padding: EdgeInsets.zero,
              isExpanded: true,
              alignment: Alignment.center,
              dropdownColor: Colors.black.withOpacity(0.65),
              focusColor: Colors.black,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  alignLabelWithHint: true,
                  // hintText: widget.hint.toLowerCase(),
                  hintText: "select subCat".toLowerCase(),
                  hintFadeDuration: const Duration(milliseconds: 500),
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.1), fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.red.withOpacity(0.8))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.3))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  // labelText: widget.hint,
                  labelText: "select SubCat",
                  labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.65), fontSize: 15),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3)),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              disabledHint: const Text('First Select Category'),
              value:
                  _selectedSubCategory.isNotEmpty ? _selectedSubCategory : null,
              items: _subCategoryList.map((element) {
                return DropdownMenuItem(
                  value: element,
                  child: Text(
                    element,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedSubCategory = newValue!;
                  print("--------printing the Buisness Category $_selectedSubCategory");

                });
              },
              padding: EdgeInsets.zero,
              isExpanded: true,
              alignment: Alignment.center,
              dropdownColor: Colors.black.withOpacity(0.65),
              focusColor: Colors.black,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  alignLabelWithHint: true,
                  // hintText: widget.hint.toLowerCase(),
                  hintText: "select subCat".toLowerCase(),
                  hintFadeDuration: const Duration(milliseconds: 500),
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.1), fontSize: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.red.withOpacity(0.8))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.3))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  // labelText: widget.hint,
                  labelText: "select SubCat",
                  labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.65), fontSize: 15),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3)),
            ),
          ],
        ),
      ),
    ));
  }
}



