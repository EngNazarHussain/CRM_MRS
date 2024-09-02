import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:crm_mrs_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

Future CustomDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.question,

    animType: AnimType.topSlide,
    dialogBorderRadius: BorderRadius.circular(50),
    headerAnimationLoop: false,
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
    descTextStyle: TextStyle(
      fontWeight: FontWeight.w400,
    ),
    title: 'Help',
    desc:
        'If you have any technical queries, you\nmay contact our technical support team\nat 1234 (Dial 4)',

    // showCloseIcon: true,
    btnCancelOnPress: () {
      Navigator.of(context).pop(); // This will close the dialog
    },
    btnOkOnPress: () {
      FlutterPhoneDirectCaller.callNumber('1234');
    }, // Replace with your phone number},
    btnOk: GestureDetector(
      onTap: () {
        // Navigator.of(context).pop(); // This will close the dialog
        FlutterPhoneDirectCaller.callNumber('1234');
      },
      child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.phone,
            color: dfColor,
          )),
    ),
    btnCancel: GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // This will close the dialog
      },
      child: Image.asset(
        "assets/icons/cross.png",
        height: 40,
      ),
    ),
  ).show();
}

Future CustomAlertDialog(BuildContext context,
    {required title,
    required dialogType,
    required description,
    required function}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.bottomSlide,
    dialogBorderRadius: BorderRadius.circular(50),
    headerAnimationLoop: false,
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
    descTextStyle: TextStyle(
      fontSize: dfFontSize,
      fontWeight: FontWeight.w500,
    ),
    btnOkColor: appcolor,
    title: title,
    desc: description,
    titleTextStyle: TextStyle(
      fontSize: lgFontSize,
      fontWeight: FontWeight.bold,
    ),

    btnOkOnPress: function, // Replace with your phone number},
    btnOkText: "Okay",
  ).show();
}
