import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/background_designs.dart';
import 'package:radigone_v3/view_model/user_view_model/auth_viewModels/otp_verification_viewModel.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/custom_button.dart';
import '../../../utils/utils.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/user_view_model/auth_viewModels/forget_password_viewModel.dart';

class UserOtpVerification extends StatefulWidget {
  final String emailAddress;

  const UserOtpVerification({super.key, required this.emailAddress});

  @override
  State<UserOtpVerification> createState() => _UserOtpVerificationState();
}

class _UserOtpVerificationState extends State<UserOtpVerification> {
  final GetIt _getIt = GetIt.instance;

  late NavigationServices _navigationServices;

  // You can use this recognizer inside the build method or as a class-level variable
  final TapGestureRecognizer _emailTapRecognizer = TapGestureRecognizer();

  String otp = '';

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //defining the pinTheme:

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
          height: MediaQuery.of(context).size.height / 2.5,
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
                  "OTP VERIFICATION",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
          child: Center(
            child: Material(
              color: MyColorScheme.authContainerColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.04,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _headerText(),
                        _otpSection(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 12,
                        ),
                        _submitOtp(),
                        _resendOtp()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
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
              text: "Enter verification code received on email address: ",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.65), fontSize: 14),
            ),
            TextSpan(
              text: widget.emailAddress,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            )
          ])),
    );
  }

  Widget _otpSection() {
    return ChangeNotifierProvider(
        create: (context) => UserOtpVerificationViewModel(),
        child: Consumer<UserOtpVerificationViewModel>(
            builder: (context, provider, _) {
          return SizedBox(
              width: 236,
              height: MediaQuery.of(context).size.width * 0.2,
              child: Pinput(
                length: 6,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: Utils.defaultPinTheme,
                focusedPinTheme: Utils.defaultPinTheme.copyWith(
                    decoration: Utils.defaultPinTheme.decoration!
                        .copyWith(border: Border.all(color: Colors.green))),
                // onCompleted: (pin) => debugPrint(pin),
                onCompleted: (pin) async{
                  //When password is filled completely perform operations and then move to the reset password Screen:
                  // if we are at signup page verification then need to go to the login Screen

                  setState(() {
                    otp = pin.toString();
                  });
                  bool result = await provider.verifyOtp(context: context,emailAddress: widget.emailAddress,code: pin.toString());
                },
              ));
        }));
  }

  Widget _submitOtp() {
    return ChangeNotifierProvider(
        create: (context) => UserOtpVerificationViewModel(),
        child: Consumer<UserOtpVerificationViewModel>(
            builder: (context, provider, _) {
          return SizedBox(
            width: 240,
            child: CustomButton(
                buttonName: "Submit OTP",
                isLoading: provider.isLoading,
                isGradient: true,
                onTap: () async {
                  bool result = await provider.verifyOtp(
                      context: context,
                      emailAddress: widget.emailAddress,
                      code: otp);
                }),
          );
        }));
  }

  Widget _resendOtp() {
    return ChangeNotifierProvider(
        create: (context) => UserForgetPasswordViewModel(),
        child: Consumer<UserForgetPasswordViewModel>(
            builder: (context, provider, _) {
          return SizedBox(
            width: 240,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Don't receive OTP?",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: " Resend OTP",
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        recognizer: _emailTapRecognizer
                          ..onTap = () {
                            provider.sendOtp(
                                context: context,
                                emailAddress: widget.emailAddress);
                          })
                  ]),
                )),
          );
        }));
  }
}
