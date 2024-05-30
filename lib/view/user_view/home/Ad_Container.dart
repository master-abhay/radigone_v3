import 'package:flutter/material.dart';

import '../../../resources/components/custom_button.dart';



class AdContainer extends StatefulWidget {
  String? title;
  String? subtitle;
  String? radigonePoints;
  String? imageUrl;
  void Function() onTap;
  AdContainer(
      {super.key,
      this.title,
      this.subtitle,
      this.radigonePoints,
      this.imageUrl,
      required this.onTap});

  @override
  State<AdContainer> createState() => _AdContainerState();
}

class _AdContainerState extends State<AdContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      // color: Colors.grey.withOpacity(0.02),

      child: Container(
        height: MediaQuery.of(context).size.height * 0.27,
        width: MediaQuery.of(context).size.height * 0.18,
        decoration: BoxDecoration(
            color: const Color(0xff818285),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height *
                  0.16, // width: MediaQuery.sizeOf(context).height*0.8,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: widget.imageUrl != null
                    ? Image.network(
                        widget.imageUrl!,
                        fit: BoxFit.fill,
                  errorBuilder: (context, object,stackTrace){
                          return Image.asset(
                            "images/dummy_add_image.png",
                            fit: BoxFit.fill,
                          );
                  },
                      )
                    : Image.asset(
                        "images/dummy_add_image.png",
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.01,
                left: MediaQuery.of(context).size.width * 0.01,
                top: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title ?? "null",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                          (widget.subtitle != null ?  widget.subtitle!.length < 10 ?  widget.subtitle :  widget.subtitle?.substring(0,10) : null) ?? "null",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "100",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Image.asset("images/coin.png")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.23,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
                child: CustomButton(
                    buttonName: "View Ad",
                    fontSize: 15,
                    height: MediaQuery.sizeOf(context).height * 0.03,
                    isLoading: false,
                    isGradient: true,
                    onTap: widget.onTap),
              ),
            )
          ],
        ),
      ),
    );
  }
}
