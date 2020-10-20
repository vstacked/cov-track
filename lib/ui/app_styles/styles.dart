import 'package:cov_tracker/core/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

Color primaryColor = "5AC7AA".toColor();
Color whiteColor = Colors.white.withOpacity(.95);
Color redColor = "F24E4E".toColor();
Color greyColor = "D3D3D3".toColor();
Color boldGreyColor = Colors.grey[600];
Color backgroundColor = "F5F5F5".toColor();

TextStyle mainTextStyle = GoogleFonts.questrial();

double normalFontSize = SizeConfig.textMultiplierTimes(2);
double mediumFontSize = SizeConfig.textMultiplierTimes(2.25);
double titleFontSize = SizeConfig.textMultiplierTimes(2.5);

TextStyle titleStyle = mainTextStyle.copyWith(
  fontWeight: FontWeight.w600,
  color: whiteColor,
  fontSize: titleFontSize,
);

TextStyle subTitleStyle = mainTextStyle.copyWith(
  fontWeight: FontWeight.w400,
  fontSize: mediumFontSize,
);

SpinKitFadingCircle loadingIndicator = SpinKitFadingCircle(
  color: primaryColor,
  size: SizeConfig.imageSizeMultiplierTimes(7.5),
);

BoxShadow boxShadow = BoxShadow(
  color: greyColor,
  blurRadius: 3.5,
  spreadRadius: .5,
);

Container backgroundPage = Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        primaryColor,
        primaryColor.withOpacity(.4),
      ],
      stops: [0, 10],
      tileMode: TileMode.clamp,
    ),
  ),
  height: kToolbarHeight * 2,
);
