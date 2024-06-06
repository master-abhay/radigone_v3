import 'package:flutter/cupertino.dart';

class AdsPreferencesViewModel with ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }



}