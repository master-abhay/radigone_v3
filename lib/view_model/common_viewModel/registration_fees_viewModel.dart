import 'package:flutter/foundation.dart';
import 'package:radigone_v3/models/common/registration_fees_model.dart';

import '../../repositories/agent/agent_auth_repository.dart';
import '../../repositories/sponsor/auth_repository.dart';
import '../../repositories/user/auth_repository.dart';

class RegistrationFeesViewModel with ChangeNotifier {
  final UserAuthRepository _userAuthRepository = UserAuthRepository();
  final SponsorAuthRepository _sponsorAuthRepository = SponsorAuthRepository();
  final AgentAuthRepository _agentAuthRepository = AgentAuthRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _registrationFees;
  String? get registrationFees => _registrationFees;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setRegistrationFees(String value) {
    _registrationFees = value;
    notifyListeners();
  }

  Future<bool> _fetchRegistrationFees(Future<RegistrationFeesModel> Function() fetchMethod) async {
    try {
      setLoading(true);
      RegistrationFeesModel response = await fetchMethod();

      if (response.registrationFees == null) {
        return false;
      }
      setRegistrationFees(response.registrationFees.toString());
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  Future<bool> getViewerRegistrationFees() {
    return _fetchRegistrationFees(() => _userAuthRepository.getRegistrationFees(headers: null));
  }

  Future<bool> getSponsorRegistrationFees() {
    return _fetchRegistrationFees(() => _sponsorAuthRepository.getRegistrationFees(headers: null));
  }

  Future<bool> getAgentRegistrationFees() {
    return _fetchRegistrationFees(() => _agentAuthRepository.getRegistrationFees(headers: null));
  }
}
