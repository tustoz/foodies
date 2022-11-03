import 'package:flutter/material.dart';

import '../constant.dart';

Widget socialMediaButton({required double scale, required String icon}) {
  return ClipOval(
    child: Container(
      width: scale * 0.15,
      height: scale * 0.15,
      color: kShadeColor,
      child: Center(child: Image.asset(icon)),
    ),
  );
}
