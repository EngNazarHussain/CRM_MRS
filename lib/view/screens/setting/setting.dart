import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/dashboard/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLocationTrackingEnabled = true;
  bool _isArrivalNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: applightcolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: appcolor, size: 30),
          onPressed: () {
            // Close action
            print('clicked');
            Get.to(() => BottomNavBar());
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: appcolor,
            fontWeight: FontWeight.w600,
            fontSize: smFontSize,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workiz for iOS version 4.148',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: dfFontSize,
              ),
            ),
            Text(
              'Your app is up to date',
              style: TextStyle(
                color: Colors.grey,
                fontSize: exSmFontSize,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Account settings',
              style: TextStyle(
                fontSize: exSmFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Last update was 1 minute ago',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
           TextButton(
  style: TextButton.styleFrom(
    side: BorderSide(color: Colors.grey),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(marginSet), // Adjust the value to reduce roundness
    ),
  ),
  onPressed: () {
    // Update action
  },
  child: Text(
    'Update now',
    style: TextStyle(
      color: Colors.grey,
    ),
  ),
),

            SizedBox(height: 20),
            CheckboxListTile(
              activeColor: Colors.blue,
              title: Text('Location tracking' ,style: TextStyle(
                fontSize: exSmFontSize,
                fontWeight: FontWeight.w600,
              ),),
              value: _isLocationTrackingEnabled,
              onChanged: (bool? value) {
                setState(() {
                  _isLocationTrackingEnabled = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              activeColor: Colors.blue,
              title: Text('Send arrival notification',  style: TextStyle(
                fontSize: exSmFontSize,
                fontWeight: FontWeight.w600,
              ),),
              subtitle: Text(
                'A push notification for quickly viewing the job you arrived at',
              ),
              value: _isArrivalNotificationEnabled,
              onChanged: (bool? value) {
                setState(() {
                  _isArrivalNotificationEnabled = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
