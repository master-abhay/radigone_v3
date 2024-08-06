import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../resources/components/custom_button.dart';
import '../../resources/components/custom_form_field.dart';
import '../../view_model/common_viewModel/change_password_view_model.dart';
import '../../view_model/services/navigation_services.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GetIt _getIt = GetIt.instance;

  late NavigationServices _navigationServices;
  late GlobalKey<FormState> _changePasswordFormKey;


  late Future<void> _initialData;
  Future<void> _fetchInitialData() async {
    final provider = Provider.of<ChangePasswordUserProvider>(context, listen: false);
    await provider.setToken();
  }

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    _changePasswordFormKey = GlobalKey<FormState>();
    super.initState();
    _initialData = _fetchInitialData();
  }

  bool _confirmPasswordObscure = true;
  final ValueNotifier<bool> _confirmPassword = ValueNotifier<bool>(false);

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
                  "CHANGE PASSWORD",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xff9C9DA1)),
                ),
              ],
            ),
          ),
        ),

        FutureBuilder<void>(future: _initialData, builder: (context,snapshot){

          if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none){
            return const Center(child: CircularProgressIndicator(strokeWidth: 1.5,color: Colors.white,),);
          }

          if(snapshot.hasError){
            print(snapshot.error.toString());
            return const Center(child: Text("Something Went Wrong! contact Support"));
          }

         return Consumer<ChangePasswordUserProvider>(builder: (context,provider,_){
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
                                vertical: MediaQuery.of(context).size.height * 0.04,
                                horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                            child: SingleChildScrollView(
                              child: Form(
                                key: _changePasswordFormKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        headerText(),
                                        SizedBox(
                                          height:
                                          MediaQuery.of(context).size.height /
                                              30,
                                        ),
                                        SizedBox(
                                            width: 294,
                                            child: CustomFormField(
                                                hintText: "Current Password",
                                                onSaved: (value) {
                                                  provider.setCurrentPassword(value!);
                                                },
                                                obscureText: false,
                                              textInputType:TextInputType.visiblePassword,
                                              onChanged: (value){

                                              },
                                                )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                            width: 294,
                                            child: CustomFormField(
                                                hintText: "New Password",
                                                onSaved: (value) {
                                                  provider.setPassword(value!);
                                                },
                                                obscureText: false,
                                                )),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                          width: 294,
                                          child: ValueListenableBuilder(
                                            valueListenable: _confirmPassword,
                                            builder:
                                                (context, value, Widget? child) {
                                              return CustomFormField(
                                                hintText: "Confirm password",
                                                onSaved: (value) {
                                                 provider.setConfirmPassword(value!);
                                                 },
                                                obscureText:
                                                _confirmPasswordObscure,
                                                icon: GestureDetector(
                                                  onTap: () {
                                                    _confirmPassword.value =
                                                    !_confirmPassword.value;
                                                    _confirmPasswordObscure =
                                                    !_confirmPasswordObscure;
                                                  },
                                                  child: _confirmPassword.value
                                                      ? const Icon(
                                                    CupertinoIcons.eye,
                                                    color: Colors.white,
                                                    // Icons.visibility,
                                                    // color: Colors.white,
                                                  )
                                                      : const Icon(
                                                    CupertinoIcons.eye_slash,
                                                    // Icons.visibility_off,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                      MediaQuery.of(context).size.height / 20,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 240,
                                          child: CustomButton(
                                              buttonName: "Save Password",
                                              isLoading: provider.isLoading,
                                              isGradient: true,
                                              onTap: () async{
                                                //Implement save password Functionality:

                                                if(_changePasswordFormKey.currentState!.validate()){
                                                  _changePasswordFormKey.currentState!.save();
                                                  provider.changePassword(context);
                                                }


                                              }),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))));
          },);

        }),

      ],
    );
  }
}

Widget headerText() {
  return SizedBox(
    width: 294,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your identity has been successfully \n   verified! set your new password",
          style: TextStyle(
              color: Colors.white.withOpacity(0.65),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
