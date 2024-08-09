import 'package:flutter/cupertino.dart';
import 'package:radigone_v3/models/common/business_category_model.dart';
import 'package:radigone_v3/repositories/common/common_repository.dart';

class BusinessCategoryViewModel with ChangeNotifier {
  final CommonRepository _commonRepository = CommonRepository();

  BusinessCategoryModel? _businessCategory;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  BusinessCategoryModel? get businessCategory => _businessCategory;

  Future<void> getBusinessCategories() async {
    _setLoading(true);
    _errorMessage = null;
    try {
      // Fetch business categories from the repository
      var response = await _commonRepository.getBusinessCategories(headers: null, body: null);
      _businessCategory = response;

      // Notify listeners to update the UI
      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString();
      debugPrint('Error fetching business categories: $_errorMessage');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
