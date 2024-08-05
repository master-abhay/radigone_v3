import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../services/alert_services.dart';

class AgentReferralLinkViewModel with ChangeNotifier {

  late AlertServices _alertServices;

  AgentReferralLinkViewModel() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
  }

  FocusNode _currentFocusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  FocusNode get currentFocusNode => _currentFocusNode;

  TextEditingController get textEditingController => _textEditingController;

  void setTextControllerValue(value) {
    _textEditingController.text = value.toString();
    notifyListeners();

  }

  void copyUrl(BuildContext context) {
    Clipboard.setData(
        ClipboardData(text: _textEditingController.text.toString()));
    _alertServices.showSnackBar("Url Copied Successfully.", context);

    notifyListeners();

  }
}
