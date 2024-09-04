import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/clients/client_detail_screen.dart';
import 'package:crm_mrs_app/view/screens/clients/new_client.dart';
import 'package:crm_mrs_app/view/screens/clients/search_clients.dart';
import 'package:crm_mrs_app/view/screens/dashboard/BottomBarScreen/dashboard.dart';
import 'package:crm_mrs_app/view/screens/estimate/estimate_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class SearchEstimate extends StatefulWidget {
  @override
  _SearchEstimateState createState() => _SearchEstimateState();
}

class _SearchEstimateState extends State<SearchEstimate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedSegment = 1; // Default to "Week" segment
  DateTime _selectedDate = DateTime.now();
  // Static list of clients

// Initialize the list with three items
  final List<Estimate> estimateList = [
    Estimate(
      status: 'Unsent',
      payment: '\$0.0',
      delivery: 'Unsent',
      estimateNumber: '1',
      username: 'Rotem',
      email: 'rotem@example.com',
    ),
    Estimate(
      status: 'Pending',
      payment: '\$100.0',
      delivery: 'In Progress',
      estimateNumber: '2',
      username: 'John',
      email: 'john@example.com',
    ),
    Estimate(
      status: 'Completed',
      payment: '\$250.0',
      delivery: 'Delivered',
      estimateNumber: '3',
      username: 'Jane',
      email: 'jane@example.com',
    ),
  ];

  // Filtered list for search functionality
  List<Estimate> filteredClients = [];

  @override
  void initState() {
    super.initState();
    // filteredClients = clients;
  }

  void _filterClients(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredClients = [];
      } else {
        filteredClients = estimateList
            .where((estimate) =>
                estimate.username.toLowerCase().contains(query.toLowerCase()) ||
                estimate.email.toLowerCase().contains(query.toLowerCase()) ||
                estimate.status.toLowerCase().contains(query.toLowerCase()) ||
                estimate.payment.toLowerCase().contains(query.toLowerCase()) ||
                estimate.delivery.toLowerCase().contains(query.toLowerCase()) ||
                estimate.estimateNumber
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: appcolor,
          ),
          onPressed: () {
            print('clicked');
            Get.to(
              () => Dashboard(),
            );
          },
        ),
        titleSpacing: 0, // Closer title to the leading icon
        title: Text(
          'Estimate',
          style: TextStyle(
              color: appcolor,
              fontSize: smFontSize,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: appcolor,
            ),
            onPressed: () {
              // Add action
              // Get.to(
              //   () => NewClientPage(),
              // );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.filter_alt_outlined,
              color: appcolor,
            ),
            onPressed: () {
              // Search action
              // Get.to(
              //   () => SearchClients(),
              //  );
            },
          ),
        ],

        backgroundColor: applightcolor,
      ),
      body: Container(
        height: scHeight,
        child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: marginSet, horizontal: marginLR),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: marginLR),
                  child: TextField(
                    onChanged: _filterClients,
                    decoration: InputDecoration(
                      hintText: '   Search ',
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10), // Reduce height
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black38,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(roundCardView),
                      ),
                    ),
                  ),
                ),
                estimateList.isNotEmpty
                    ? Container(
                        height: scHeight / 1.3,
                        width: scWidth,
                        child: ListView.builder(
                          itemCount: estimateList.length,
                          itemBuilder: (context, index) {
                            final estimate = estimateList[index];
                            return GestureDetector(
                              onDoubleTap: () {
                                Get.to(
                                  () => EstimateDetailsScreen(),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: dfColor, // Background color
                                  borderRadius: BorderRadius.circular(
                                      roundCardView + 5), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.2), // Shadow color
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                      offset: Offset(0, 3), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    // Start line
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: Container(
                                        width: 2,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        color: Colors.purple,
                                      ),
                                    ),
                                    // Middle line

                                    // Content
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(' ${estimate.status}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.purple)),
                                                Text(' ${estimate.payment}'),
                                                Text('${estimate.delivery}'),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Estimate #${estimate.estimateNumber}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  marginSet),
                                                      child: Icon(
                                                        Icons.person_2_outlined,
                                                        color:
                                                            btnTextLightColor,
                                                      ),
                                                    ),
                                                    Text('${estimate.username}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  marginSet),
                                                      child: Icon(
                                                          Icons.email_outlined,
                                                          color:
                                                              btnTextLightColor),
                                                    ),
                                                    Text('${estimate.email}'),
                                                  ],
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
                            );
                          },
                        ),
                      )

                    // Status List Column

                    : Container(
                        height: scHeight / 1.3,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/ic_search.png',
                                height: 150,
                                width: 150,
                              ),
                              Text(
                                'No result found',
                                style: TextStyle(
                                    fontSize: dfFontSize,
                                    color: btnTextColor,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontSize: exSmFontSize,
                                    color: btnTextLightColor),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            )),
      ),
    );
  }
}

class Estimate {
  final String status;
  final String payment;
  final String delivery;
  final String estimateNumber;
  final String username;
  final String email;

  Estimate({
    required this.status,
    required this.payment,
    required this.delivery,
    required this.estimateNumber,
    required this.username,
    required this.email,
  });
}
