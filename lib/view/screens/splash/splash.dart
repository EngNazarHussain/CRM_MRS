import 'dart:async';
import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/model/apis/api_client.dart';
import 'package:crm_mrs_app/model/database/local_db.dart';
import 'package:crm_mrs_app/model/repository/auth_repo.dart';
import 'package:crm_mrs_app/view/screens/dashboard/bottomNavBar.dart';
import 'package:crm_mrs_app/view/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:upgrader/upgrader.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer? _timer;
  static String appVersion = 'Version 1.0.0';
  var box = GetStorage();
  final AuthRepo authRepo = AuthRepo(apiClient: ApiClient());
  _startDelay() {
    _timer = Timer(Duration(seconds: 7), _goNext);
  }

  checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = 'Version ' + packageInfo.version.toString();
  }

  _goNext() async {
    String userEmail = await DBManager().fetchLoginUserEmail();

    if (userEmail != "") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => UpgradeAlert(
                upgrader: Upgrader(
                  showIgnore: false,
                  showLater: false,
                  showReleaseNotes: false,
                  canDismissDialog: false,
                  durationUntilAlertAgain: const Duration(microseconds: 1),
                ),
                child: BottomNavBar())),
        //   Home(
        //     arguments2: 'Splash',
        //   ),
        // )
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => UpgradeAlert(
                upgrader: Upgrader(
                  showIgnore: false,
                  showLater: false,
                  showReleaseNotes: false,
                  canDismissDialog: false,
                  durationUntilAlertAgain: const Duration(microseconds: 1),
                ),
                child: LogIn())),
      );

      // Get.offAll(() => LogIn());
    }
  }

  @override
  void initState() {
    super.initState();

    checkVersion();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // Adjust the height as needed
          color: dfColor, // Container background color
          child: Container(
            margin: EdgeInsets.symmetric(vertical: marginLR),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/app_icon.png', // Replace with your actual asset path
                      width: 350,
                      height: 350,
                    ),
                    // Shimmer.fromColors(
                    //   period: Duration(milliseconds: 1500),
                    //   baseColor: Colors.transparent,
                    //   highlightColor: Colors.white70,
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     width: 145,
                    //     height: 145,
                    //     decoration: BoxDecoration(
                    //       borderRadius:
                    //           BorderRadius.circular(255), // Adjust as needed
                    //       color: Colors.white, // Adjust as needed
                    //     ),
                    //   ),
                    // ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    appVersion.toString(),
                    style: TextStyle(
                        color: appcolor,
                        fontSize: exSmFontSize,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              
                Text(
                  "CRM MRS",
                  style: TextStyle(
                    color: appcolor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
