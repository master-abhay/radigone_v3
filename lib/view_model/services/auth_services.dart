import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _userTokenKey = 'user_token';
  static const String _sponsorTokenKey = 'sponsor_token';
  static const String _agentTokenKey = 'agent_token';

  Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userTokenKey, token);
  }

  Future<void> saveSponsorToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sponsorTokenKey, token);
  }

  Future<void> saveAgentToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_agentTokenKey, token);
  }

  Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userTokenKey);
  }

  Future<String?> getSponsorToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sponsorTokenKey);
  }

  Future<String?> getAgentToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_agentTokenKey);
  }

  Future<void> clearAllTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userTokenKey);
    await prefs.remove(_sponsorTokenKey);
    await prefs.remove(_agentTokenKey);
  }
}
