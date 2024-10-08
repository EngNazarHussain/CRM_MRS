import 'package:flutter/material.dart';

const marginLR = 15.0;
const marginSet = 5.0; // If the marginLR add more 5 it's also increment 5

/// -------- Font Size
const double exXSmFontSize = 12.0;
const double exSmFontSize = 14.0;
const double dfFontSize = 16.0;
const double smFontSize = 18.0;
const double lgFontSize = 20.0;
const double exLgFontSize = 22.0;

///------- Icon Size
const double dfIconSize = 22;

const double dfElevation = 8.0;
const double smElevation = 4.0;

///------- App Color

const dfColor = Colors.white;
const appcolor = Color.fromRGBO(250, 196, 1, 1);
const appcolorlabel = Color.fromRGBO(0, 3, 8, 1);
const applightcolor = Color.fromRGBO(18, 38, 57, 1);
const appcolorHex = "#152238";
const lightappcolor = Color.fromRGBO(1, 63, 39, 0.529);
const greyColor = Color.fromRGBO(245, 245, 245, 1);
const greyLoaderColor = Color.fromRGBO(245, 245, 245, 0.5);
const lightGrey = Color.fromRGBO(253, 250, 250, 1);
const lightGrey1 = Color.fromRGBO(237, 237, 237, 1);
const drakGreyColor1 = Color.fromRGBO(219, 218, 218, 1);
const drakGreyColor = Color.fromRGBO(237, 237, 237, 1);
const btnTextColor = Color.fromRGBO(0, 34, 69, 1);
const btnTextLightColor = Color.fromRGBO(0, 35, 69, 0.65);
const blackColor = Colors.black;
const lightBlackColor = Color.fromARGB(255, 74, 73, 73);
const redAlert = Color.fromRGBO(252, 235, 233, 1);
const yellowAlert = Color.fromRGBO(254, 247, 229, 1);
const blueAlert = Color.fromRGBO(243, 249, 250, 1);

const dfGreyColor = Color(0xfff1B1B1B);

///---------- Rounded Style

const roundBtn = 25.0;
const roundloginField = 5.0;
const roundCardView = 5.0;
const roundView = 50.0;

const lgBlue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(3, 76, 99, 1),
      Color.fromRGBO(63, 99, 158, 1),
    ]);

const lgWhite = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.white]);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
