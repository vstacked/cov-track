import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

Color primaryColor = "5AC7AA".toColor();
Color whiteColor = Colors.white.withOpacity(.95);
Color redColor = "F24E4E".toColor();
Color greyColor = "D3D3D3".toColor();

TextStyle mainTextStyle = GoogleFonts.questrial();

TextStyle titleStyle = mainTextStyle.copyWith(
  fontWeight: FontWeight.w600,
  color: whiteColor,
  fontSize: 22,
);

TextStyle subTitleStyle = mainTextStyle.copyWith(
  fontWeight: FontWeight.w400,
  fontSize: 18,
);

SpinKitFadingCircle loadingIndicator = SpinKitFadingCircle(color: primaryColor);

BoxShadow boxShadow = BoxShadow(
  color: greyColor,
  blurRadius: .5,
  spreadRadius: .5,
);
