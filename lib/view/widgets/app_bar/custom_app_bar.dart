import 'package:crm_mrs_app/constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? userName;
   final String? userType;
  final Widget? leading;
  final List<Widget>? actions;
  final GlobalKey<ScaffoldState> scaffoldKey; // Add this line

  CustomAppBar({
    this.userName,
    this.userType,
    this.leading,
    this.actions,
    required this.scaffoldKey, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: applightcolor,
      // title: Text(
      //   textAlign: TextAlign.left,
      //   userName ?? '',
      //   style: TextStyle(
      //     color: dfColor,
      //     fontWeight: FontWeight.w700,
      //     fontSize: lgFontSize,
      //   ),
      // ),
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 46),
        child: Container(
          margin: EdgeInsetsDirectional.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
        userName ?? 
                'User Name',
                style: TextStyle(
                  color: Colors.yellow[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Hey ',
                  style: TextStyle(
                      color: Colors.white, fontSize: exXSmFontSize + 1),
                  children: <TextSpan>[
                    TextSpan(
                      text: userType?? 'User Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ', here is your upcoming day'),
                  ],
                ),
              ),
              SizedBox(height: 2),
            ],
          ),
        ),
      ),
      titleSpacing: 0,
      leading: Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.format_align_left_rounded,
              color: appcolor,
            ),
            onPressed: () {
              print('clicked');
              scaffoldKey.currentState
                  ?.openDrawer(); // Use the key to open the drawer
            },
          ),
          SizedBox(height: 8),
          // Text(
          //   textAlign: TextAlign.left,
          //   title ?? 'CRM MRS',
          //   style: TextStyle(
          //     color: dfColor,
          //     fontWeight: FontWeight.w700,
          //     fontSize: lgFontSize,
          //   ),
          // ),
        ],
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: marginLR),
          child: IconButton(
            icon: Icon(
              Icons.search_outlined,
              size: lgFontSize,
              color: appcolor,
            ),
            onPressed: () {
              // CustomDialog(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
