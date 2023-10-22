// ignore: file_names
import 'package:flutter/material.dart';

Widget gameItemchoose(
  BuildContext context,
  VoidCallback onTap,
  String text,
  String imageGame,
) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 100,
          child: Image.asset(text),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 163,
          width: 163,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(imageGame),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
              height: 67,
              width: 99,
              child: Image.asset('assets/images/icons/play.png')),
        ),
      ],
    ),
  );
}
