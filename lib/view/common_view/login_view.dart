import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_phone_input.dart';
import 'package:radigone_v3/utils/utils.dart';
import 'package:radigone_v3/view/common_view/forgot_password_view.dart';

import '../../resources/colors.dart';
import '../../resources/components/custom_button.dart';
import '../../resources/components/custom_form_field.dart';
import '../../utils/constants.dart';
import '../../view_model/agent_view_model/agent_auth_viewModels/agent_login_viewModel.dart';
import '../../view_model/services/alert_services.dart';
import '../../view_model/services/navigation_services.dart';
import '../../view_model/sponsor_view_model/sponsor_auth_viewModel/sponsor_login_view_model.dart';
import '../../view_model/user_view_model/user_auth_viewModels/login_view_model.dart';

class LoginView extends StatefulWidget {
  final UserType userType;

  const LoginView({super.key, required this.userType});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with MediaQueryMixin {
  late GlobalKey<FormState> _loginFormState;

  String? _countryCode, _mobile, _password;

  bool isLoading = false;

  //Creating the instance of get_it package:
  final GetIt _getIt = GetIt.instance;

  late NavigationServices _navigationServices;
  late AlertServices _alertServices;

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _alertServices = _getIt.get<AlertServices>();

    _loginFormState = GlobalKey<FormState>();

    // Creating userProvider:

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildUI(),
    );
  }

  Widget buildUI() {
    return Stack(
      children: [
        //background start
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
        ),
        Container(
          width: double.infinity,
          height: screenHeight / 2.6,
          decoration: const BoxDecoration(
              gradient: MyColorScheme.yellowLinearGradient,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  child: Image.asset(
                    "images/splash_logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "WELCOME BACK",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        //background end
        Consumer<LoginUserProvider>(
            builder: (context, provider, Widget? child) {
          return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.all(kPadding),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColorScheme.authContainerColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.04,
                      horizontal: kPadding,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _loginFormState,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomPhoneFormInputField(
                                hintText: "Phone number",
                                onChanged: (value) {
                                  _mobile = value!.number;
                                  _countryCode = value.countryCode.substring(1);
                                }),
                            kFormFieldHeight,
                            CustomFormField(
                              hintText: "Password",
                              onSaved: (value) {
                                _password = value!;
                              },
                              obscureText: false,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      _navigationServices.goBack();
                                      _navigationServices.push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPassword(
                                                      userType:
                                                          widget.userType)));
                                    },
                                    child: Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight / 12,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 240,
                                  child: CustomButton(
                                      buttonName: "Login",
                                      isLoading: widget.userType == UserType.viewer
                                          ? provider.isLoading
                                          : widget.userType == UserType.sponsor
                                              ? Provider.of<
                                                          LoginSponsorProvider>(
                                                      context)
                                                  .isLoading
                                              : widget.userType == UserType.agent
                                                  ? Provider.of<
                                                              AgentLoginViewModel>(
                                                          context)
                                                      .isLoading
                                                  : false,
                                      isGradient: true,
                                      onTap: () async {
                                        //Implement Login Functionality
                                        setState(() {
                                          isLoading = true;
                                        });

                                        if (_loginFormState.currentState!
                                            .validate()) {
                                          //saving the username and password:
                                          _loginFormState.currentState!.save();

                                          switch (widget.userType) {
                                            case UserType.viewer:
                                              await provider.loginUser(
                                                  context: context,
                                                  countryCode:
                                                      _countryCode ?? '',
                                                  mobile: _mobile ?? "",
                                                  password: _password ?? "");
                                            case UserType.sponsor:
                                              Provider.of<LoginSponsorProvider>(
                                                      context,
                                                      listen: false)
                                                  .loginSponsor(
                                                context: context,
                                                countryCode: _countryCode ?? '',
                                                mobile: _mobile ?? "",
                                                password: _password ?? "",
                                              );
                                            case UserType.agent:
                                              Provider.of<AgentLoginViewModel>(
                                                      context,
                                                      listen: false)
                                                  .loginAgent(
                                                context: context,
                                                countryCode: _countryCode ?? '',
                                                mobile: _mobile ?? "",
                                                password: _password ?? "",
                                              );
                                          }
                                        }
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: 236,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have an account?",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white
                                                  .withOpacity(0.8)),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              switch (widget.userType) {
                                                case UserType.viewer:
                                                  _navigationServices
                                                      .pushReplacementNamed(
                                                          "/registrationPage");
                                                  break;
                                                case UserType.sponsor:
                                                  _navigationServices
                                                      .pushReplacementNamed(
                                                          "/sponsorRegistrationView");
                                                  break;
                                                case UserType.agent:
                                                  _navigationServices
                                                      .pushReplacementNamed(
                                                          "/agentRegistrationView");
                                                  break;
                                              }
                                            },
                                            child: const Text(
                                              " Register",
                                              style: TextStyle(
                                                  color: Colors.yellow,
                                                  fontSize: 12),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )));
        }),
      ],
    );
  }
}
