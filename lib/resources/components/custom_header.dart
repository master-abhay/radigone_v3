

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';

class CustomHeader extends StatefulWidget {

  String? title;
  CustomHeader({super.key,
    this.title});

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
      margin: const EdgeInsets.only(top: 60, bottom: 40),
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
          child:  Row(
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

  String? title;
  CustomHeaderWithBackButton({super.key,
    this.title});

  @override
  State<CustomHeaderWithBackButton> createState() => _CustomHeaderWithBackButtonState();
}

class _CustomHeaderWithBackButtonState extends State<CustomHeaderWithBackButton> {
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
      margin: const EdgeInsets.only(top: 60, bottom: 40),
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
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(flex:2,child: IconButton(onPressed: (){
                _navigationServices.goBack();
              },icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),)),
              Expanded(flex:5,
                child: Text(

                  widget.title ?? "Title",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}

