import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crm_mrs_app/view/screens/dashboard/BottomBarScreen/calls/calls_list.dart';
import 'package:crm_mrs_app/view/screens/dashboard/BottomBarScreen/clients/clients_list.dart';
import 'package:crm_mrs_app/view/screens/dashboard/BottomBarScreen/dashboard.dart';
import 'package:crm_mrs_app/view/screens/dashboard/BottomBarScreen/task.dart';
import 'package:crm_mrs_app/view/screens/dashboard/drawer/custom_drawer.dart';
import 'package:crm_mrs_app/view/screens/dashboard/BottomBarScreen/schedule/schedule.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../../../constant.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = '/bottomNavBar';

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with TickerProviderStateMixin {
  String initialTabString = "Dashboard";
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  bool isOpened = false;
  bool errorLod = false;
  String userName = '';
  String userStatus = '';
  String userTypeDisplay = '';
  String userEmail = '';
  String authToken = '';
  bool isLoading = true;

  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        errorLod = true;
      });
    } else {
      setState(() {
        errorLod = false;
      });
    }
  }

  Future<void> loadSessionData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? firstName = prefs.getString('first_name');
    final String? lastName = prefs.getString('last_name');
    final String? status = prefs.getString('status');
    final String? token = prefs.getString('token');
    final String? userType = prefs.getString('user_type');

    if (firstName != null && lastName != null) {
      setState(() {
        userName = '$firstName $lastName';
        userStatus = status ?? 'Unknown';
        authToken = token ?? 'N/A';
        userTypeDisplay = userType ?? 'Unknown';
        isLoading = false;
      });

      checkConnectivity();

      if (errorLod == true) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.bottomSlide,
          title: 'No Internet Connection!',
          desc:
              'No active internet connection was found! \n The app will not run in offline mode, for the best experience, please connect to the internet!',
          btnCancel: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.check),
            color: Colors.green,
          ),
        ).show();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadSessionData().then((_) {
      setState(() {
        _widgetOptions = [
          Dashboard(user: userName, userTypeDisplay: userTypeDisplay, isLoading: isLoading),
          ScheduleScreen(userTypeDisplay,userName),
          News( userTypeDisplay,userName),
          CallListScreen( userTypeDisplay,userName),
          ClientsListScreen( userTypeDisplay,userName),
        ];
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        initialTabString = "Home";
      } else if (index == 1) {
        initialTabString = "Schedule";
      } else if (index == 2) {
        initialTabString = "Message";
      } else if (index == 3) {
        initialTabString = "Call";
      } else if (index == 4) {
        initialTabString = "Clients";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator()); // Show loading state
    }

    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;

    return SideMenu(
      key: _endSideMenuKey,
      inverse: true,
      background: applightcolor,
      type: SideMenuType.shrinkNSlide,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: CustomDrawer(userTypeDisplay, userName),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomAppBar(
          color: dfColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildTabItem(index: 0, icon: Icons.home_filled, text: "Home"),
              _buildTabItem(index: 1, icon: Icons.calendar_today_outlined, text: "Schedule"),
              _buildTabItem(index: 2, icon: Icons.message_outlined, text: "Message"),
              _buildTabItem(index: 3, icon: Icons.call, text: "Call"),
              _buildTabItem(index: 4, icon: Icons.group_outlined, text: "Clients"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({required int index, required IconData icon, required String text}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _selectedIndex == index ? Colors.green : lightBlackColor,
              size: smFontSize + 2,
            ),
            SizedBox(width: 4), // Space between icon and text
            Text(
              text,
              style: TextStyle(
                  color: _selectedIndex == index ? Colors.green : lightBlackColor,
                  fontSize: exXSmFontSize - 1),
            ),
          ],
        ),
      ),
    );
  }
}
