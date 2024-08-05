import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:radigone_v3/resources/components/account_Status.dart';

import '../../../data/response/status.dart';
import '../../../view_model/user_view_model/user_points_view_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double height;
  final void Function() openDrawer;
  const CustomAppBar({super.key,required this.height,required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffFDD900),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const AccountStatus(),
            Container(
              // color: Colors.purple,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              // height: 37,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Hamburger:
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: openDrawer,
                          child: Container(
                            // height: 40,
                            // width: 20,
                            // color:Colors.green,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset("images/hamburger.svg"),
                          ),
                        ),
                      ),

                      //Radigone Icon:

                      Expanded(
                        flex: 4,
                        child: Image.asset(
                          "images/splash_logo.png",
                          height: 23,
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 12,
                              color: Colors.transparent,
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 15,
                        // alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 10, left: 3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Consumer<UserPointsViewModel>(
                                  builder: (context, providerValue, _) {
                                    switch (providerValue.userPointsViewModel.status) {
                                      case Status.LOADING:
                                        return const Text(
                                          'Fetching..',
                                          style: TextStyle(
                                              fontSize: 10, fontWeight: FontWeight.bold),
                                        );

                                      case Status.ERROR:
                                        return const Text(
                                          'Error',
                                          style: TextStyle(
                                              fontSize: 10, fontWeight: FontWeight.bold),
                                        );
                                      case Status.NONE:
                                        return const Text(
                                          'None',
                                          style: TextStyle(
                                              fontSize: 10, fontWeight: FontWeight.bold),
                                        );
                                      case Status.COMPLETED:
                                        return Text(
                                          double.parse(providerValue.userPointsViewModel.data!.data.toString()).toStringAsFixed(0),
                                          style: const TextStyle(
                                              fontSize: 10, fontWeight: FontWeight.bold),
                                        );
                                      case null:
                                        return const Text(
                                          "Null",
                                          style: TextStyle(
                                              fontSize: 10, fontWeight: FontWeight.bold),
                                        );
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 27,
                        width: 27,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(180)),
                        child: Image.asset("images/coin.png"),
                        // child: SvgPicture.asset("images/coin.svg"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
