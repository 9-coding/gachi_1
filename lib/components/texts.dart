import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

// text 디자인 관리하는 코드 !
class AppTextStyles {

  static const TextStyle text_style = TextStyle(
    color : Colors.black,
  );

  static const TextStyle mainStyle = TextStyle(
    fontSize: 19.0,
    color : Colors.black,   // black
    fontWeight: FontWeight.w100,
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 16.0,
    color : Colors.black,
  );
  static const TextStyle sub1Style = TextStyle(
    fontSize: 15.0,
    color : Colors.black,
  );

  static const TextStyle stateTextStyle = TextStyle(
    fontSize: 15.0,
    color : Color.fromARGB(255, 157, 157, 157),
  );


  static const TextStyle postTitleTextStyle = TextStyle(
    color: Color(0xFF053149),
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );

  static const postSubTextStyle = TextStyle(
    color: Colors.black26,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle postSub2TextStyle = TextStyle(
    color: Colors.black87,
    fontSize: 16.0,
  );

  static const TextStyle nicknameTextStyle = TextStyle(
    color: Colors.black87,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
}
