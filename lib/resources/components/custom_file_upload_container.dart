import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFileUploadContainer extends StatelessWidget {
  final File file;
  void Function() onTap;
   CustomFileUploadContainer({required this.file, Key? key,required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        border: Border.all(color: Colors.blue.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              file.path.split('/').last,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          GestureDetector(
              onTap: onTap,
              child: Icon(Icons.delete_outline,color: Colors.orange.withOpacity(0.9),)),

        ],
      ),
    );
  }
}
