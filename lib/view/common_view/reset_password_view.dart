import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/background_designs.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';

import '../../resources/colors.dart';
import '../../resources/components/custom_button.dart';
import '../../resources/components/custom_text_field.dart';
import '../../utils/constants.dart';
import '../../view_model/common_viewModel/reset_password_viewModel.dart';
import '../../view_model/services/navigation_services.dart';

class ResetPassword extends StatefulWidget {
  final  emailAddress, token;
  final UserType userType;
  const ResetPassword(
      {super.key,
      required this.userType,
      required this.emailAddress,
      required this.token});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GetIt _getIt = GetIt.instance;

  late NavigationServices _navigationServices;
  late AlertServices _alertServices;

  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  final ValueNotifier<bool> _passwordNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _confirmPasswordNotifier =
      ValueNotifier<bool>(false);

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _alertServices = _getIt.get<AlertServices>();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _passwordNotifier.dispose();
    _confirmPasswordNotifier.dispose();
    super.dispose();
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
        const LowerBackgroundDesign(),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2.6,
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
                  "RESET PASSWORD",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xff9C9DA1)),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
                child: Material(
                    color: MyColorScheme.authContainerColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.04,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: SingleChildScrollView(
                          child: Form(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    _headerText(),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              30,
                                    ),
                                    _passwordField(),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    _confirmPasswordField(),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                ),
                                _savePasswordField(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))))
      ],
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: 294,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text:
                  "Your identity has been successfully verified! Set your new password",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.65), fontSize: 14),
            ),
          ])),
    );
  }

  Widget _passwordField() {
    return SizedBox(
        width: 294,
        child: ValueListenableBuilder(
            valueListenable: _passwordNotifier,
            builder: (context, value, Widget? child) {
              return CustomTextField(
                currentFocusNode: _passwordFocusNode,
                nextFocusNode: _confirmPasswordFocusNode,
                controller: _passwordController,
                hintText: "New Password",
                textCapitalization: false,
                maxLines: 1,
                onChanged: (value) {
                  _passwordController.text = value!;
                },
                obscureText: _passwordNotifier.value,
                textInputType: TextInputType.visiblePassword,
                icon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordNotifier.value = !_passwordNotifier.value;
                    });
                  },
                  child: _passwordNotifier.value
                      ? const Icon(
                          CupertinoIcons.eye_slash,
                          color: Colors.white,
                        )
                      : const Icon(
                          CupertinoIcons.eye,
                          color: Colors.white,
                        ),
                ),
              );
            }));
  }

  Widget _confirmPasswordField() {
    return SizedBox(
        width: 294,
        child: ValueListenableBuilder(
            valueListenable: _confirmPasswordNotifier,
            builder: (context, value, Widget? child) {
              return CustomTextField(
                currentFocusNode: _confirmPasswordFocusNode,
                controller: _confirmPasswordController,
                hintText: "Confirm Password",
                textCapitalization: false,
                maxLines: 1,
                onChanged: (value) {
                  _confirmPasswordController.text = value!;
                },
                textInputType: TextInputType.visiblePassword,
                obscureText: _confirmPasswordNotifier.value,
                icon: GestureDetector(
                  onTap: () {
                    _confirmPasswordNotifier.value =
                        !_confirmPasswordNotifier.value;
                  },
                  child: _confirmPasswordNotifier.value
                      ? const Icon(
                          CupertinoIcons.eye_slash,
                          color: Colors.white,
                        )
                      : const Icon(
                          CupertinoIcons.eye,
                          color: Colors.white,
                        ),
                ),
              );
            }));
  }

  Widget _savePasswordField() {
    return Column(
      children: [
        SizedBox(
          width: 240,
          child: ChangeNotifierProvider(
            create: (context) => ResetPasswordViewModel(),
            child: Consumer<ResetPasswordViewModel>(
              builder: (context, provider, _) {
                return CustomButton(
                    buttonName: "Save Password",
                    isLoading: provider.isLoading,
                    isGradient: true,
                    onTap: () {
                      if (_passwordController.text.isNotEmpty &&
                          _confirmPasswordController.text.isNotEmpty &&
                          _passwordController.text ==
                              _confirmPasswordController.text) {
                        // Implement save password functionality here

                        switch (widget.userType) {
                          case UserType.viewer:
                            provider.userResetPassword(
                                context: context,
                                emailAddress: widget.emailAddress,
                                token: widget.token,
                                newPassword: _passwordController.text);
                            break;
                          case UserType.sponsor:
                            provider.sponsorResetPassword(
                                context: context,
                                emailAddress: widget.emailAddress,
                                token: widget.token,
                                newPassword: _passwordController.text);
                            break;
                          case UserType.agent:
                            provider.agentResetPassword(
                                context: context,
                                emailAddress: widget.emailAddress,
                                token: widget.token,
                                newPassword: _passwordController.text);
                            break;
                        }
                      } else {
                        // Show a snackBar or dialog to notify user about the password mismatch
                        _alertServices.showSnackBar(
                            "Password do not match", context);
                      }
                    });
              },
            ),
          ),
        ),
        SizedBox(
          width: 240,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Go back to",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {
                      // Implement go to Register functionality here:
                      switch (widget.userType) {
                        case UserType.viewer:
                          _navigationServices
                              .pushReplacementNamed("/registrationPage");
                          break;
                        case UserType.sponsor:
                          _navigationServices
                              .pushReplacementNamed("/sponsorRegistrationView");
                          break;
                        case UserType.agent:
                          _navigationServices
                              .pushReplacementNamed("/agentRegistrationView");
                          break;
                      }
                    },
                    child: const Text(
                      " Register",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
