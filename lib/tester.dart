import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_input_decoration.dart';
import 'package:radigone_v3/resources/components/dropdowns/business_category_dependent_dropdown.dart';
import 'package:radigone_v3/view_model/common_viewModel/business_categories_viewModel.dart';
import 'models/common/business_category_model.dart';

class DependentDropdownsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusinessCategoryViewModel()..getBusinessCategories(),
      child: Consumer<BusinessCategoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          }

          final categories = viewModel.businessCategory?.data?.categories ?? [];
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(title: Text('Dependent Dropdowns')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              // child:



            ),
          );
        },
      ),
    );
  }
}

