import 'package:crm_mrs_app/model/controller/auth_controller.dart';
import 'package:crm_mrs_app/model/resources/values_manager.dart';
import 'package:crm_mrs_app/view/screens/dashboard/bottomNavBar.dart';
import 'package:crm_mrs_app/view/widgets/dialogs/custom_dialog.dart';
import 'package:crm_mrs_app/view/widgets/dialogs/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../../../constant.dart';

final getx = GetConnect();

class LogIn extends StatefulWidget {
  static const routeName = '/login';
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _device_token = '';
  bool _showPassword = false;

  void _login(
      AuthController authController, _email, _password, _device_token) async {
    if (_email.isEmpty) {
      showCustomSnackBar('Enter User Name'.tr);
      _isLoading = false;
    }
    // else if (!GetUtils.isEmail(_email)) {
    //   showCustomSnackBar('enter a valid email address'.tr);
    //   _isLoading = false;
    // }
    else if (_password.isEmpty) {
      showCustomSnackBar('enter password'.tr);
      _isLoading = false;
    }
    // else if (_password.length < 9) {
    //   showCustomSnackBar('password_should_be '.tr);
    // }

    else {
      authController
          .login(_email, _password, _device_token)
          .then((status) async {
        if (status.isSuccess) {
          debugPrint(
              "=======status${status.isSuccess}:${status.message}=======");
          _isLoading = false;
          Get.offAll(
            () => BottomNavBar(),
            arguments: 'login',
          );
        } else {
          debugPrint(
              "=======status${status.isSuccess}:${status.message}=======");
          final regex =
              RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

          showCustomSnackBar(status.message.replaceAll(regex, '').trim());
          _isLoading = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;

    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: lightGrey1,
            body: OverlayLoaderWithAppIcon(
              overlayBackgroundColor: appcolor,
              isLoading: _isLoading,
              appIcon: CircularProgressIndicator(),
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: marginSet),
                  color: lightGrey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Section 1: Non-scrollable content
                      Container(
                        margin: EdgeInsets.only(top: scHeight / 10),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/app_icon.png', // Replace with your actual asset path
                                  width: 90,
                                  height: 90,
                                ),
                                // Shimmer.fromColors(
                                //   period: Duration(milliseconds: 2000),
                                //   baseColor: Colors.transparent,
                                //   highlightColor: Colors.white70,
                                //   child: Container(
                                //     alignment: Alignment.center,
                                //     width: 120,
                                //     height: 120,
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(
                                //           75), // Adjust as needed
                                //       color: Colors.white, // Adjust as needed
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                            Container(
                              margin: Platform.isAndroid
                                  ? EdgeInsets.only(top: scHeight / 10.1)
                                  : EdgeInsets.only(top: scHeight / 10.7),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Welcome Back ",
                                        style: TextStyle(
                                            color: btnTextColor,
                                            fontSize: lgFontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "",
                                        style: TextStyle(
                                            color: appcolor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: marginLR + 30),
                                    child: Text(
                                      "sign in to continue",
                                      style: TextStyle(
                                        color: lightBlackColor,
                                        fontSize: exSmFontSize,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Section 2: Scrollable content
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: AppSize.s30, left: 25, right: 25),
                                  child: TextFormField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      prefixIconColor: blackColor,
                                      suffixIconColor: blackColor,
                                      labelStyle: TextStyle(color: blackColor),
                                      hintText: 'Your Business Email',
                                      // prefixIcon: Icon(
                                      //   Icons.email_outlined,
                                      //   size: dfIconSize,
                                      // ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            roundloginField),
                                      ),
                                      filled: true,
                                      fillColor: dfColor,
                                      contentPadding: const EdgeInsets.only(
                                          left: marginLR - 5,
                                          bottom: marginLR - 5,
                                          top: marginLR - 5),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: blackColor),
                                        borderRadius: BorderRadius.circular(
                                            roundloginField),
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontSize: dfFontSize,
                                        color: blackColor),
                                    keyboardType: TextInputType.emailAddress,
                                    // validator: validateEmail,
                                    onChanged: (value) {
                                      setState(() {
                                        _email = value.trim();
                                      });
                                    },
                                  ),
                                ),
                                //////////////////
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: AppSize.s30,
                                            left: 25,
                                            right: 25),
                                        child: TextFormField(
                                          autofocus: false,
                                          style: TextStyle(
                                              fontSize: dfFontSize,
                                              color: blackColor),
                                          decoration: InputDecoration(
                                            prefixIconColor: blackColor,
                                            suffixIconColor: blackColor,
                                            labelStyle:
                                                TextStyle(color: blackColor),
                                            hintText: 'Password',
                                            // prefixIcon: Icon(
                                            //   Icons.lock_outlined,
                                            //   size: dfIconSize,
                                            // ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      roundloginField),
                                            ),
                                            filled: true,
                                            fillColor: dfColor,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: marginLR - 5,
                                                    bottom: marginLR - 5,
                                                    top: marginLR - 5),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: blackColor),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      roundloginField),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _showPassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: lightBlackColor,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _showPassword =
                                                      !_showPassword;
                                                });
                                              },
                                            ),
                                          ),
                                          obscureText:
                                              !_showPassword, // Toggle visibility
                                          //  validator: validatePassword,
                                          onChanged: (value) {
                                            setState(() {
                                              _password = value.trim();
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 10),
                                        child: Column(children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [],
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        width: scWidth,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              print(
                                                  'Email: $_email, Password: $_password');
                                              _isLoading = true;
                                              _isLoading = false;
                                              Get.offAll(
                                                () => BottomNavBar(),
                                                arguments: 'login',
                                              );

                                              // if (defaultTargetPlatform ==
                                              //     TargetPlatform.android) {
                                              //   _login(_, _email, _password,
                                              //       'Android');
                                              // } else if (defaultTargetPlatform ==
                                              //     TargetPlatform.iOS) {
                                              //   _login(_, _email, _password,
                                              //       'IOS');
                                              // }
                                            }
                                          },
                                          child: Text(
                                            'LOGIN',
                                            style: TextStyle(
                                                color: btnTextColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: appcolor,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      roundBtn),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, right: 20),
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w700,
                                              fontSize: exSmFontSize),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 50),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Contact Support Team to reset your password',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: dfFontSize),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 35,
                                        ),
                                        width: scWidth,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'For Any Query Please Call At: ',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: dfFontSize),
                                            ),
                                            Text(
                                              '1234',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dfFontSize),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // Handle the tap event
                                                CustomDialog(context);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: marginLR - 5),
                                                child: Icon(
                                                  Icons.info_outline,
                                                  size: dfIconSize + 10,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
