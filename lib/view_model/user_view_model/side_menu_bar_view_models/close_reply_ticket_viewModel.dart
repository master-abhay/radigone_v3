import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/user/sideBar_repository.dart';
import '../../services/alert_services.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';
import '../../services/navigation_services.dart';

class CloseReplyTicketViewmodel with ChangeNotifier {
  late AlertServices _alertServices;
  late NavigationServices _navigationServices;

  CloseReplyTicketViewmodel() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  String? _token;
  List<File> _selectedFilesList = [];

  List<File> get selectedFileList => _selectedFilesList;
  addFileToList(File file) {
    _selectedFilesList.add(file);
    notifyListeners();
  }

  removeFileFromList(File file) {
    _selectedFilesList.removeAt(_selectedFilesList.indexOf(file));
    notifyListeners();
  }

  clearAllFiles() {
    _selectedFilesList.clear();
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> setToken() async {
    _token = await SecureStorage().readSecureData('token');
    if (kDebugMode) {
      print('Printing the Token from Transaction viewModel: $_token');
    }
    notifyListeners();
  }

  final _myRepo = userSidebarRepository();

  Future<bool> closeTicket(
      {required dynamic ticketId, required BuildContext context}) async {
    setLoading(true);

    if (kDebugMode) {
      print('printing the ticket Id: -------------->>>>>>>>$ticketId');
    }
    await setToken();

    Map header = <String, String>{
      'Content-Type': 'application/json',
      "Authorization": _token!,
    };

    _myRepo
        .userCloseTicketsApi(ticketId: ticketId, header: header, body: null)
        .then((value) {
      clearAllFiles();
      setLoading(false);
      _alertServices.flushBarErrorMessages(value['message'], context);
      return true;
    }).onError((error, stackTrace) {
      setLoading(false);
      _alertServices.flushBarErrorMessages(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
      return false;
    });
    return true;
  }
}
