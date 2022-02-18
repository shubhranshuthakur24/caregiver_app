import 'package:flutter/material.dart';
import 'package:givershealths/SRC/style/colors.dart';

BoxDecoration ContainerGradientBackground() {
  return BoxDecoration(
      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [gradientBlue, gradientRed]));
}
