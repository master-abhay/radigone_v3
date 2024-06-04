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



  static const String _userNameKey = 'user_name';
  static const String _sponsorNameKey = 'sponsor_name';
  static const String _agentNameKey = 'agent_name';

  static const String _userEmailKey = 'user_email';
  static const String _sponsorEmailKey = 'sponsor_email';
  static const String _agentEmailKey = 'agent_email';

  static const String _userImageLinkKey = 'user_image_link';
  static const String _sponsorImageLinkKey = 'sponsor_image_link';
  static const String _agentImageLinkKey = 'agent_image_link';

  // User Name
  Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  // Sponsor Name
  Future<void> saveSponsorName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sponsorNameKey, name);
  }

  Future<String?> getSponsorName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sponsorNameKey);
  }

  // Agent Name
  Future<void> saveAgentName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_agentNameKey, name);
  }

  Future<String?> getAgentName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_agentNameKey);
  }

  // User Email
  Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmailKey, email);
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  // Sponsor Email
  Future<void> saveSponsorEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sponsorEmailKey, email);
  }

  Future<String?> getSponsorEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sponsorEmailKey);
  }

  // Agent Email
  Future<void> saveAgentEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_agentEmailKey, email);
  }

  Future<String?> getAgentEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_agentEmailKey);
  }


  // User Image Link
  Future<void> saveUserImageLink(String imageLink) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userImageLinkKey, imageLink);
  }

  Future<String?> getUserImageLink() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userImageLinkKey);
  }

  // Sponsor Image Link
  Future<void> saveSponsorImageLink(String imageLink) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sponsorImageLinkKey, imageLink);
  }

  Future<String?> getSponsorImageLink() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sponsorImageLinkKey);
  }

  // Agent Image Link
  Future<void> saveAgentImageLink(String imageLink) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_agentImageLinkKey, imageLink);
  }

  Future<String?> getAgentImageLink() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_agentImageLinkKey);
  }

  // Clear All User Data
  Future<void> clearAllUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userTokenKey);
    await prefs.remove(_sponsorTokenKey);
    await prefs.remove(_agentTokenKey);
    await prefs.remove(_userNameKey);
    await prefs.remove(_sponsorNameKey);
    await prefs.remove(_agentNameKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_sponsorEmailKey);
    await prefs.remove(_agentEmailKey);
    await prefs.remove(_userImageLinkKey);
    await prefs.remove(_sponsorImageLinkKey);
    await prefs.remove(_agentImageLinkKey);
  }

}
