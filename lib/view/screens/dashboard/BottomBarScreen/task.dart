import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/dashboard/drawer/custom_drawer.dart';
import 'package:crm_mrs_app/view/widgets/app_bar/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

class News extends StatefulWidget {
  bool isLoading = true;

  News();
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Create GlobalKey

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey, // Assign key to Scaffold
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: CustomDrawer(), // Your custom drawer widget
      body: OverlayLoaderWithAppIcon(
          overlayBackgroundColor: Colors.transparent,
          isLoading: widget.isLoading,
          appIcon: CircularProgressIndicator(),
          child: Container(
            margin: EdgeInsets.all(marginLR + marginLR),
            child: Column(
              children: [Text('task')],
            ),
          )),
    );
  }
}
