import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:radigone_v3/resources/components/custom_button.dart';
import 'package:radigone_v3/resources/components/custom_text_field.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_deposit_viewModel.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_header.dart';

class SponsorDepositNowView extends StatefulWidget {
  const SponsorDepositNowView({super.key});

  @override
  State<SponsorDepositNowView> createState() => _SponsorDepositNowViewState();
}

class _SponsorDepositNowViewState extends State<SponsorDepositNowView> {

  late Razorpay _razorpay;

  late AlertServices _alertServices;

  FocusNode _currentFocusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  //Creating instance of RazorPay:

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _alertServices.showToast(message: "Payment Success: ${response.paymentId!.toString()}");
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _alertServices.showToast(message: "Payment Success: ${response.message!.toString()}");

    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    _alertServices.showToast(message: "Payment Success: ${response.walletName!.toString()}");

  }

  void openCheckOut(amount) async {
    amount = amount * 100;

    var options = {
      // 'key': 'rzp_test_1DP5mmOlF5G5ag',
      'key':'rzp_test_WY8eAGLUsaD2Iq',//my personal test key
      'amount': amount,
      'name': 'Abhay Kumar',
      'prefill': {'contact': '8091771052', 'email': 'abhay71052@gmail.com'},
      'external': ['paytm']
    };

    try {
      _razorpay.open(options);

    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void initState() {

    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();

    _razorpay = Razorpay();
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    try{
      _razorpay.clear();
    }catch(e){
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        const LowerBackgroundDesign(),
        const UpperBackgroundDesign(),
        CustomHeaderWithBackButton(
          title: "Deposit",
        ),
        Consumer<SponsorDepositViewModel>(builder: (context, provider, _) {
          return Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 120, bottom: 10),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          'Deposit Limit: 10-100000 INR',
                          style: MyColorScheme.LargeHeadingTextStyle(),
                        ),
                        Text(
                          'Charges: 0 INR',
                          style: MyColorScheme.LargeHeadingTextStyle(),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).width * 0.2,
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset('images/razorpay.svg'),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        CustomTextField(
                            currentFocusNode: _currentFocusNode,
                            controller: _textEditingController,
                            obscureText: false,
                            hintText: "Enter Amount Here",
                            isNumber: true,
                            onChanged: (value) {
                              setState(() {
                                _textEditingController.text = value!;
                              });
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            buttonName: "Deposit Now",
                            isLoading: false,
                            isGradient: true,
                            onTap: () async {

                              if(_textEditingController.text.isNotEmpty){
                                openCheckOut(int.parse(_textEditingController.text.toString()));
                              }

                            })
                      ])));
        })
      ],
    );
  }
}
