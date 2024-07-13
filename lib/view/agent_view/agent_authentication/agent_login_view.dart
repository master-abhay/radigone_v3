import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/view_model/agent_view_model/agent_authentication_viewModels/agent_login_viewModel.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_login_view_model.dart';

import '../../../resources/colors.dart';
import '../../../resources/components/custom_button.dart';
import '../../../resources/components/custom_form_field.dart';
import '../../../view_model/services/alert_services.dart';
import '../../../view_model/services/navigation_services.dart';



class AgentLoginView extends StatefulWidget {
  const AgentLoginView({super.key});

  @override
  State<AgentLoginView> createState() => _AgentLoginViewState();
}

class _AgentLoginViewState extends State<AgentLoginView> {
  late GlobalKey<FormState> _loginFormState;

  // String? username, password;

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
    print("Build");
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
                  "WELCOME BACK",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        Consumer<AgentLoginViewModel>(
            builder: (context, provider, Widget? child) {
              return SizedBox(
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
                                  vertical:
                                  MediaQuery.of(context).size.height * 0.04,
                                  horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                              child: SingleChildScrollView(
                                child: Form(
                                  key: _loginFormState,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                              width: 294,
                                              child: CustomFormField(
                                                hintText: "Phone number",
                                                onSaved: (value) {
                                                  provider.setUsername(value);
                                                },
                                                obscureText: false,
                                                isNumber: true
                                                ,
                                                textCapitalization: false,)),
                                          const SizedBox(height: 15),
                                          SizedBox(
                                            width: 294, // height: 30,
                                            child: CustomFormField(
                                              hintText: "Password",
                                              onSaved: (value) {
                                                provider.setPassword(value);
                                              },
                                              obscureText: false,
                                              isNumber: false,
                                              textCapitalization: false,),),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          SizedBox(
                                            width: 294,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      //Implement Forgot password Functionality:
                                                      _navigationServices
                                                          .pushReplacementNamed(
                                                          "/forgotPassword");
                                                    },
                                                    child: Text(
                                                      "Forgot password?",
                                                      style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(0.8)),
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                        MediaQuery.of(context).size.height / 12,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 240,
                                            child: CustomButton(
                                                buttonName: "Login",
                                                isLoading: provider.isLoading,
                                                isGradient: true,
                                                onTap: () async {
                                                  //Implement Login Functionality

                                                  if (_loginFormState.currentState!
                                                      .validate()) {
                                                    //saving the username and password:
                                                    _loginFormState.currentState!
                                                        .save();
                                                    await provider.loginAgent(context);

                                                  }
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
                                                        //Implement move to register Screen Functionality here:
                                                        _navigationServices
                                                            .pushReplacementNamed(
                                                            "/registrationPage");
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
                          ))));
            }),
      ],
    );
  }
}
