import 'package:crm_mrs_app/view/screens/dashboard/drawer/custom_drawer.dart';
import 'package:crm_mrs_app/view/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';

class Complaint extends StatefulWidget {
  const Complaint({super.key});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  bool _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Create GlobalKey

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;

//////////----------------------------

    // Use allChartModel to display the data in your widget
    return Scaffold(
      key: _scaffoldKey, // Assign key to Scaffold
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      drawer: CustomDrawer(), // Your custom drawer widget
      body: Container(
        margin: EdgeInsets.only(left: marginLR, right: marginLR, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Complaint",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: dfGreyColor),
            ),
          ],
        ),
      ),
    );
  }
}
