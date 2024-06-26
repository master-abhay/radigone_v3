import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../repositories/user/sideBar_repository.dart';
import '../../services/alert_services.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';
import '../../services/navigation_services.dart';

class CreateTicketViewModel with ChangeNotifier {
  late AlertServices _alertServices;
  late NavigationServices _navigationServices;
  CreateTicketViewModel() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  List<File> _selectedFiles = [];

  String? _token, _name, _email, _subject, _message;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setSelectedFiles(File file) {
    _selectedFiles.add(file);
    notifyListeners();
  }

  clearSelectedFiles() {
    _selectedFiles.clear();
    notifyListeners();
  }

  removeFileFromList(File file) {
    _selectedFiles.removeAt(_selectedFiles.indexOf(file));
    notifyListeners();
  }

  Future<void> setToken() async {
    _token = await SecureStorage().readSecureData('token');
    if (kDebugMode) {
      print('Printing the Token from Transaction viewModel: $_token');
    }
  }

  List<File?> get selectedFiles => _selectedFiles;

  setName(value) {
    _name = value;
    notifyListeners();
  }

  setEmail(value) {
    _email = value;
    notifyListeners();
  }

  setSubject(value) {
    _subject = value;
    notifyListeners();
  }

  setMessage(value) {
    _message = value;
    notifyListeners();
  }

  final _myRepo = userSidebarRepository();

  Future<bool> createTicket(BuildContext context) async {
    setLoading(true);

    if (_name == null || _name!.isEmpty) {
      setLoading(false);
      _alertServices.flushBarErrorMessages("Name Required", context);
      return false;
    }
    if (_email == null || _email!.isEmpty) {
      setLoading(false);

      _alertServices.flushBarErrorMessages("Email Required", context);
      return false;
    }
    if (_subject == null || _subject!.isEmpty) {
      setLoading(false);

      _alertServices.flushBarErrorMessages("Subject Required", context);
      return false;
    }
    if (_message == null || _message!.isEmpty) {
      setLoading(false);

      _alertServices.flushBarErrorMessages("Message Required", context);
      return false;
    }

    await setToken();

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": _token ?? '',
    };

    var fields = {
      'name': _name ?? '',
      'email': _email ?? '',
      'subject': _subject ?? '',
      'message': _message ?? ''
    };

    var files = <http.MultipartFile>[];

    for (var file in _selectedFiles) {
      var stream = http.ByteStream(file.openRead());
      var length = await file.length();
      var multipartFile = http.MultipartFile('attachments[]', stream, length,
          filename: file.path.split('/').last,
          contentType: MediaType('application', 'octet-stream'));
      files.add(multipartFile);
    }

    _myRepo
        .userCreateTicket(fields: fields, files: files, headers: headers)
        .then((value) {
      // _navigationServices.goBack();
      _alertServices.flushBarErrorMessages(value['message'], context);
      if (kDebugMode) {
        print("Api hit");
      }
      clearSelectedFiles();
      setLoading(false);
      return true;
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      setLoading(false);
      return false;
    });

    return true;
  }
}
