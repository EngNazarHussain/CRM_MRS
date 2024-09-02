// Import the libraries with a prefix
// Hide CarouselController from one of the imports
import 'package:crm_mrs_app/view/screens/dashboard/drawer/custom_drawer.dart';
import 'package:crm_mrs_app/view/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:crm_mrs_app/model/apis/api_client.dart';
import 'package:crm_mrs_app/model/repository/auth_repo.dart';

import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../../../constant.dart';

class Dashboard extends StatefulWidget {
  Dashboard();
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthRepo authRepo = AuthRepo(apiClient: ApiClient());
  bool isLoading = true;
  final List<Map<String, dynamic>> dashboardData = [
    {
      'title': 'Today',
      'items': [
        {'label': 'Sales', 'value': '\$0.00', 'color': Colors.green},
        {'label': 'Collected', 'value': '\$0.00', 'color': Colors.blue},
        {'label': 'Jobs done', 'value': '0', 'color': Colors.orange},
        {'label': 'Jobs canceled', 'value': '0', 'color': Colors.pink},
        {'label': 'Jobs created', 'value': '0', 'color': Colors.purple},
      ],
    },
    {
      'title': 'Technicians',
      'items': [
        {
          'label': 'This dashboard has no data',
          'value': '',
          'color': null,
          'hasData': false,
        },
      ],
    },
    {
      'title': 'Sales',
      'items': [
        {
          'label': 'This dashboard has no data',
          'value': '',
          'color': null,
          'hasData': false,
        },
      ],
    },
    {
      'title': 'Jobs',
      'items': [
        {'label': 'Submitted', 'value': '17', 'color': Colors.blue},
        {'label': 'Canceled', 'value': '2', 'color': Colors.red},
        {'label': 'Deleted', 'value': '-3', 'color': Colors.orange},
      ],
    },
    {
      'title': 'Estimates',
      'items': [
        {'label': 'Unsent', 'value': '1', 'color': Colors.grey},
      ],
    },
    {
      'title': 'Invoices',
      'items': [
        {
          'label': '0.00 • 0 INVOICES',
          'value': 'Pending',
          'color': Colors.orange
        },
        {
          'label': '0.00 • 0 INVOICES',
          'value': 'Past due',
          'color': Colors.red
        },
      ],
    },
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Create GlobalKey

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;

    return OverlayLoaderWithAppIcon(
        overlayBackgroundColor: Colors.transparent,
        isLoading: isLoading,
        appIcon: CircularProgressIndicator(),
        child: Container(
          child: Scaffold(
            key: _scaffoldKey, // Assign key to Scaffold

            appBar: CustomAppBar(
              scaffoldKey: _scaffoldKey,
            ),
            drawer: CustomDrawer(), // Your custom drawer widget
            body: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                // Upcoming Work Section
                _buildUpcomingWorkSection(),
                Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: smFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                // Today and Technicians Row
                Row(
                  children: [
                    Expanded(child: _buildTodayCard()),
                    SizedBox(width: 10),
                    Expanded(child: _buildTechniciansCard()),
                  ],
                ),

                SizedBox(height: 16),

                // Graph Section
                _buildGraphSection(),

                SizedBox(height: 16),

                // Jobs and Estimates Row
                Row(
                  children: [
                    Expanded(child: _buildJobsCard()),
                    SizedBox(width: 16),
                    Expanded(child: _buildEstimatesCard()),
                  ],
                ),

                SizedBox(height: 16),

                // Invoices and Empty Space Row
                Row(
                  children: [
                    Expanded(child: _buildInvoicesCard()),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(), // Empty container to fill space
                    ),
                  ],
                ),
              ],
            ),

            floatingActionButton: Container(
              decoration: BoxDecoration(
                  color: appcolor,
                  borderRadius: BorderRadius.all(Radius.circular(500))),
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
                backgroundColor: appcolor,
              ),
            ),
          ),
        ));
  }

  Widget _buildUpcomingWorkSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming work',
          style: TextStyle(
              fontSize: smFontSize,
              fontWeight: FontWeight.bold,
              color: btnTextColor),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            color: dfColor,
            borderRadius: BorderRadius.circular(roundCardView),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/app_icon.png', // Replace with your asset
                height: 30,
              ),
              SizedBox(height: 10),
              Text(
                'Nothing on your schedule',
                style: TextStyle(color: blackColor, fontSize: 16),
              ),
              SizedBox(height: 5),
              TextButton(
                onPressed: () {},
                child: Text(
                  '+ Create job',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTodayCard() {
    return Container(
      height: 214,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(roundCardView),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(
                    fontSize: exXSmFontSize - 3,
                    fontWeight: FontWeight.w700,
                    color: btnTextColor),
              ),
              Text(
                'Update a few seconds ago ↻',
                style: TextStyle(
                    fontSize: exXSmFontSize - 6, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          // SizedBox(height: 10),
          _buildDashboardItem('Sales', '\$0.00', Colors.green),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          _buildDashboardItem('Collected', '\$0.00', Colors.blue),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          _buildDashboardItem('Jobs done', '0', Colors.orange),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          _buildDashboardItem('Jobs canceled', '0', Colors.pink),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          _buildDashboardItem('Jobs created', '0', Colors.purple),
        ],
      ),
    );
  }

  Widget _buildTechniciansCard() {
    return Container(
      height: 214,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Technicians',
                style: TextStyle(
                    fontSize: exXSmFontSize - 3,
                    fontWeight: FontWeight.w700,
                    color: btnTextColor),
              ),
              Text(
                'Update a few seconds ago ↻',
                style: TextStyle(
                    fontSize: exXSmFontSize - 6, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/app_icon.png', // Replace with your asset
                  height: 50,
                ),
                SizedBox(height: 5),
                Text(
                  'This dashboard has no data',
                  style:
                      TextStyle(color: btnTextColor, fontSize: exXSmFontSize),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Try reloading',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors
                            .blue, // Matches the underline color with the text color
                      ) // Adds the underline),

                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGraphSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sales',
            style: TextStyle(
                fontSize: dfFontSize,
                fontWeight: FontWeight.bold,
                color: btnTextColor),
          ),
          SizedBox(height: 10),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/app_icon.png', // Replace with your asset
                  height: 30,
                ),
                SizedBox(height: 5),
                Text(
                  'This dashboard has no data',
                  style: TextStyle(color: btnTextColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Try reloading',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobsCard() {
    return Container(
      height: 155,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jobs',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          // SizedBox(height: 10),
          _buildDashboardItem('Submitted', '17', Colors.blue),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          _buildDashboardItem('Canceled', '2', Colors.red),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          _buildDashboardItem('Deleted', '-3', Colors.orange),
        ],
      ),
    );
  }

  Widget _buildEstimatesCard() {
    return Container(
      height: 155,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimates',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          // SizedBox(height: 10),
          _buildDashboardItem('Unsent', '1', Colors.grey),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
        ],
      ),
    );
  }

  Widget _buildInvoicesCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoices',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          _buildDashboardItem('Pending', '0.00 • 0 INVOICES', Colors.orange),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
          _buildDashboardItem('Past due', '0.00 • 0 INVOICES', Colors.red),
          Divider(
              // indent: marginLR,
              // endIndent: marginLR,
              ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(fontSize: exXSmFontSize),
              ),
            ],
          ),
          Text(value),
        ],
      ),
    );
  }
}
