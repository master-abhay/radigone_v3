import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/data/response/ApiResponse.dart';
import 'package:radigone_v3/view_model/services/flutter_secure_storage/secure_storage.dart';

import '../../../models/user_models/side_menu_bar/User_transaction_model.dart';
import '../../../repositories/user/sideBar_repository.dart';
import '../../services/alert_services.dart';
import '../../services/navigation_services.dart';

class TransactionViewModel with ChangeNotifier {
  String? _token;

  Future<void> setToken() async {
    _token = await SecureStorage().readSecureData('token');
    if (kDebugMode) {
      print('Printing the Token from Transaction viewModel: $_token');
    }
  }

  late AlertServices _alertServices;
  late NavigationServices _navigationServices;

  TransactionViewModel() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  final _myRepo = userSidebarRepository();

  ApiResponse<UserTransactionModel> transactionsHistory = ApiResponse.loading();

  setTransactionHistory(ApiResponse<UserTransactionModel> response) {
    transactionsHistory = response;
    notifyListeners();
  }

  fetchTransactions(BuildContext context) async {
    await setToken();

    setTransactionHistory(ApiResponse.loading());

    Map headers = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": _token!,
    };

    _myRepo.userTransactionApi(header: headers).then((value) {
      setTransactionHistory(ApiResponse.completed(value));
      if (kDebugMode) {
        print("Api hit");
      }
    }).onError((error, stackTrace) {
      setTransactionHistory(ApiResponse.error(error.toString()));
      _alertServices.flushBarErrorMessages(error.toString(), context);

      if (kDebugMode) {
        print('Error Occurred: ${error.toString()}');
      }
    });
  }
}
