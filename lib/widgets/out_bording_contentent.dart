import 'dart:ui';

import 'package:flutter/material.dart';

class OutBordingContentet extends StatelessWidget {
  final String text;
  final Image image;

  OutBordingContentet({
    required this.image,
    this.text = 'a'
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/Workflow_2.png',

           height: 300,
           width: 400,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200))
      ],
    );
  }
}
