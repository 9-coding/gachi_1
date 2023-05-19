import 'package:flutter/material.dart';

import 'colors.dart';

Widget button(String text, {VoidCallback? onPressed}) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      margin: const EdgeInsets.all(5),
      width: 3000,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.sub2Color, borderRadius: BorderRadius.circular(25)),
      child: TextButton(
        onPressed: onPressed,
        child: Center(child: Text(text)),
      ),
    ),
  );
}