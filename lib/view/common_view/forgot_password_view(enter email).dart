import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_text_field.dart';
import 'package:radigone_v3/utils/constants.dart';

import '../../resources/colors.dart';
import '../../resources/components/custom_button.dart';
import '../../view_model/common_viewModel/forget_password_viewModel.dart';
import '../../view_model/services/navigation_services.dart';
import 'forgot_password_otp_verification_view.dart';

class ForgotPassword extends StatefulWidget {
  final UserType userType;
  const ForgotPassword({super.key, required this.userType});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GetIt _getIt = GetIt.instance;

  late NavigationServices _navigationServices;

  late TextEditingController _emailController;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _emailController = TextEditingController();
    _emailFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
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
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
        ),
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
                  "FORGOT PASSWORD",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                                              30),
                                  _emailAddressField(),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 7,
                              ),
                              _sendOtpButton()
                            ],
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
      child: Text(
        "Enter your registered email address to receive password reset instruction",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white.withOpacity(0.65),
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emailAddressField() {
    return SizedBox(
        width: 294,
        child: CustomTextField(
          hintText: "Email Address",
          currentFocusNode: _emailFocusNode,
          controller: _emailController,
          onChanged: (value) {
            _emailController.text = value!;
          },
          obscureText: false,
          textInputType: TextInputType.emailAddress,
        ));
  }

  Widget _sendOtpButton() {
    return ChangeNotifierProvider(
        create: (context) => ForgetPasswordViewModel(),
        child: Consumer<ForgetPasswordViewModel>(
          builder: (context, provider, _) {
            return SizedBox(
              width: 240,
              child: CustomButton(
                  buttonName: "Send OTP",
                  isLoading: provider.isLoading,
                  isGradient: true,
                  onTap: () async {
                    bool? result;

                    switch (widget.userType) {
                      case UserType.viewer:
                        result = await provider.sendViewerOtp(
                            context: context,
                            emailAddress: _emailController.text);
                        break;
                      case UserType.sponsor:
                        result = await provider.sendSponsorOtp(
                            context: context,
                            emailAddress: _emailController.text);
                        break;
                      case UserType.agent:
                        result = await provider.sendAgentOtp(
                            context: context,
                            emailAddress: _emailController.text);
                        break;
                    }
                    if (result!) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserOtpVerificationView(
                                    userType: widget.userType,
                                    emailAddress: _emailController.text,
                                  )));
                    }
                  }),
            );
          },
        ));
  }
}
