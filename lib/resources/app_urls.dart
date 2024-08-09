class AppUrls {
  static const String baseUrl = "https://staging.radigone.com/api/";
  static const String viewerBaseUrl = "https://staging.radigone.com/api/v1/user/";


  static get logoutUrl => "https://staging.radigone.com/api/v1/user/logout";



  //<-----------------User Start ---------------->


  static get viewerRegistrationFees => "https://staging.radigone.com/api/v1/user/regestraionfees";

  static get viewerRegister => 'https://staging.radigone.com/api/v1/user/register';

  static get userLoginUrl => 'https://staging.radigone.com/api/v1/user/login';

  static get userForgetPasswordUrl => 'https://staging.radigone.com/api/v1/user/forgetpassword';

  static get userVerifyCode => 'https://staging.radigone.com/api/v1/user/verifycode';

  static get userResetPassword => 'https://staging.radigone.com/api/v1/user/resetpassword';


  static get userDashboardAdsUrl => 'https://staging.radigone.com/api/v1/user/dashboard';

  static get userProfileUrl => 'https://staging.radigone.com/api/v1/user/profile-info';

  static get userProfileUpdateUrl => 'https://staging.radigone.com/api/v1/user/profile-update';

  static get userChangePasswordUrl => 'https://staging.radigone.com/api/v1/user/change-password';

  static get userRadigonePointUrl => 'https://staging.radigone.com/api/v1/user/radigone-point';

  static get userUserPointUrl => '${baseUrl}user-points';

  static get userRedeemRadigonePointsUrl => '${baseUrl}redeeme-points';

  static get userTransactionUrl => 'https://staging.radigone.com/api/v1/user/transaction/history';

  static get userCreateSupportTicketUrl =>
      'https://staging.radigone.com/api/v1/user/support-ticket/store';

  static get userMyTicketsUrl => 'https://staging.radigone.com/api/v1/user/support-tickets';

  static get userCloseTicketUrl => 'https://staging.radigone.com/api/v1/user/reply-ticket/';

  static get userAllAdsPreferencesUrl => 'http://radigone.com/api/v1/all-ad-preferences';

  static get userSelectedAdsPreferencesUrl => 'https://staging.radigone.com/api/v1/user/ad-preference/list';

  static get viewerSmsVerification => 'https://staging.radigone.com/api/v1/user/verify-smscode';





//<-----------------User End---------------->


// <------------Sponsor Start------------>
  static get sponsorLoginUrl => 'https://radigone.com/api/v1/surveys/login';




  static get sponsorRegistrationFees => 'https://staging.radigone.com/api/v1/surveyor/regestraionfees';

  static get registerSponsor => 'https://staging.radigone.com/api/v1/surveys/register';

  static get sponsorProfileInformationUrl => 'https://radigone.com/api/v1/survey/survey-info';
  static get sponsorSmsVerification => 'https://staging.radigone.com/api/v1/surveys/verify-smscode';




  //<------------Sponsor End------------>>


  //<------------Agent Start------------>>
  static get agentLoginUrl => 'https://radigone.com/api/v1/agent/login';
  static get agentRegistrationFees => 'https://staging.radigone.com/api/v1/agent/regestraionfees';
  static get agentSmsVerification => 'https://staging.radigone.com/api/v1/agent/verify-smscode';

//<------------Agent End------------>


  static get getBusinessCategories => 'https://staging.radigone.com/api/v1/surveys/categories';


}
