import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/Timesheets/time_sheet.dart';
import 'package:crm_mrs_app/view/screens/estimate/search_estimate.dart';
import 'package:crm_mrs_app/view/screens/invoices/invoices.dart';
import 'package:crm_mrs_app/view/screens/job/search_job.dart';
import 'package:crm_mrs_app/view/screens/login/login.dart';
import 'package:crm_mrs_app/view/screens/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: dfColor,
      shape: LinearBorder(),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 160, // Set the desired height for the header here
            child: DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(0),
                color: applightcolor, // Change color to match your design
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person,
                            size: 35, color: appcolor), // Change icon and color
                      ),
                      SizedBox(width: 10),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: marginLR),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Usman',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'MRS Garage Door',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: dfColor,
                    borderRadius:
                        BorderRadiusDirectional.circular(roundCardView),
                  ),
                  child: Column(
                    children: [
                      _createDrawerItem(
                        icon: Icons.access_time,
                        text: 'Timesheets',
                        color: Colors.red,
                        onTap: () {
                          Get.offAll(
                            () => TimeSheetsScreen(),
                          );
                        },
                      ),
                      Divider(
                        endIndent: marginLR,
                        indent: marginLR,
                        thickness: .5,
                      ),
                      _createDrawerItem(
                        icon: Icons.work_history_outlined,
                        text: 'Jobs',
                        color: btnTextColor,
                        onTap: () {
                          Get.offAll(
                            () => SearchJobs(),
                          );
                        },
                      ),
                      _createDrawerItem(
                        icon: Icons.receipt_long_outlined,
                        text: 'Invoices',
                        color: btnTextColor,
                        onTap: () {
                          Get.offAll(
                            () => SearchInvoices(),
                          );
                        },
                      ),
                      _createDrawerItem(
                        icon: Icons.assessment_outlined,
                        text: 'Estimates',
                        color: btnTextColor,
                        onTap: () {
                          Get.offAll(
                            () => SearchEstimate(),
                          );
                        },
                      ),
                      Divider(
                        endIndent: marginLR,
                        indent: marginLR,
                        thickness: .5,
                      ),
                      _createDrawerItem(
                        icon: Icons.settings_outlined,
                        text: 'Settings',
                        color: btnTextColor,
                        onTap: () {

 Get.offAll(
                            () => SettingsScreen(),
                          );
                          
                        },
                      ),
                      _createDrawerItem(
                        icon: Icons.help_outline_outlined,
                        text: 'Get help',
                        color: btnTextColor,
                        onTap: () {},
                      ),
                      _createDrawerItem(
                        icon: Icons.logout_rounded,
                        text: 'Log out',
                        color: btnTextColor,
                        onTap: () {
                          Get.offAll(
                            () => LogIn(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //   Spacer(), // Spacer pushes the next widget to the bottom
          Container(
            width: 320,
            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/icons/app_icon.png',
                  height: 30,
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Refer a friend.', // Replace with your desired content
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'You both get \$100 \n to spend!', // The dollar sign is escaped with a backslash
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.keyboard_double_arrow_right_rounded,
                  color: dfColor,
                  size: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData? icon, String? text, Color? color, GestureTapCallback? onTap}) {
    return ListTile(
      trailing: text == 'Timesheets'
          ? Icon(
              Icons.arrow_forward_ios_sharp,
              size: smFontSize,
            )
          : null,
      title: Row(
        children: <Widget>[
          Icon(icon, color: color),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text ?? ''),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
