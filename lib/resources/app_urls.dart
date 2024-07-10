class AppUrls {

  static const String baseUrl = "https://radigone.com/api/";
  static const String viewerBaseUrl = "https://radigone.com/api/v1/user/";





  static get userLoginUrl => '${viewerBaseUrl}login';
  static get userForgetPasswordUrl => '${viewerBaseUrl}forgetpassword';
  static get userVerifyCode => '${viewerBaseUrl}verifycode';
  static get userResetPassword => '${viewerBaseUrl}resetpassword';
  static get userLogoutUrl => "${baseUrl}v1/logout";

  static get userDashboardAdsUrl => '${viewerBaseUrl}dashboard';
  static get userProfileUrl => '${viewerBaseUrl}profile-info';
  static get userProfileUpdateUrl => '${viewerBaseUrl}profile-update';
  static get userChangePasswordUrl => '${viewerBaseUrl}change-password';
  static get userRadigonePointUrl => '${viewerBaseUrl}radigone-point';
  static get userUserPointUrl => '${baseUrl}user-points';
  static get userRedeemRadigonePointsUrl => '${baseUrl}redeeme-points';
  static get userTransactionUrl => '${viewerBaseUrl}transaction/history';
  static get userCreateSupportTicketUrl => '${viewerBaseUrl}support-ticket/store';
  static get userMyTicketsUrl => '${viewerBaseUrl}support-tickets';
  static get userCloseTicketUrl => '${viewerBaseUrl}reply-ticket/';
  static get userAllAdsPreferencesUrl => 'http://radigone.com/api/v1/all-ad-preferences';
  static get userSelectedAdsPreferencesUrl => '${viewerBaseUrl}ad-preference/list';

















  static get sponsorLoginUrl => 'http://radigone.com/api/v1/surveys/login';
  static get sponsorRegisterUrl => 'http://radigone.com/api/v1/surveys/register';
  static get sponsorProfileInformationUrl => 'http://radigone.com/api/v1/survey/survey-info';





  static get agentLoginUrl => 'http://radigone.com/api/v1/agent/login';











}
