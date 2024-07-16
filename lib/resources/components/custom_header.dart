import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';

class CustomHeader extends StatefulWidget {
  String? title;
  CustomHeader({super.key, this.title});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.14, bottom: 40),
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).width * 0.15,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title ?? "Title",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHeaderWithBackButton extends StatefulWidget {
  final String title;
  const CustomHeaderWithBackButton({super.key, required this.title});

  @override
  State<CustomHeaderWithBackButton> createState() =>
      _CustomHeaderWithBackButtonState();
}

class _CustomHeaderWithBackButtonState
    extends State<CustomHeaderWithBackButton> {
  late NavigationServices _navigationServices;

  @override
  void initState() {
    super.initState();
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.14, bottom: 10),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child:

            ////Now below code is deprecated....
            // Material(
            //   elevation: 1,
            //   borderRadius: BorderRadius.circular(12),
            //   child: Container(
            //     width: MediaQuery.sizeOf(context).width * 0.9,
            //     height: MediaQuery.sizeOf(context).width * 0.15,
            //     decoration: BoxDecoration(
            //       color: Colors.black,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.max,
            //       // mainAxisAlignment: MainAxisAlignment.center,
            //       // crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Expanded(
            //           flex: 2,
            //             child: Container(
            //               // color: Colors.white,
            //               child: IconButton(
            //                 onPressed: () {
            //                   _navigationServices.goBack();
            //                 },
            //                 icon: const Icon(
            //                   Icons.arrow_back_ios_new,
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             )),
            //         Expanded(
            //           flex: 20,
            //           child: Container(
            //             // color: Colors.green,
            //             child: Row(
            //               mainAxisSize: MainAxisSize.max,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   widget.title ?? "Title",
            //                   style: const TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 20,
            //                       fontWeight: FontWeight.w600),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).width * 0.15,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _navigationServices.goBack();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
