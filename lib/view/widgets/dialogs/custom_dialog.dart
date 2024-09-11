import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:crm_mrs_app/constant.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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
     // FlutterPhoneDirectCaller.callNumber('1234');
    }, // Replace with your phone number},
    btnOk: GestureDetector(
      onTap: () {
        // Navigator.of(context).pop(); // This will close the dialog
        // FlutterPhoneDirectCaller.callNumber('1234');
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
      child: Icon(Icons.close_rounded)
    ),
  ).show();
}

Future<void> CustomAlertDialog(
  BuildContext context, {
  required String title,
  required DialogType dialogType,
  required String description,
  required VoidCallback function,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundBtn),
        ),
        title: Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(
            fontSize: lgFontSize,
            fontWeight: FontWeight.bold,color: btnTextColor
          ),
        ),
        content: Text(
            textAlign: TextAlign.center,
          description,
          style: TextStyle(
            fontSize: dfFontSize,
            fontWeight: FontWeight.w400,color: btnTextColor
          ),
        ),
        actions: [
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  function(); // Execute the provided function
                  Navigator.of(context).pop(); // Optionally close the dialog
                },
                child: Text("Leave", style: TextStyle(color: dfColor),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 50), // Full width button
                ),
              ),
              SizedBox(height: 8), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Cancel", style: TextStyle(color: btnTextColor),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  minimumSize: Size(double.infinity, 50), // Full width button
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
