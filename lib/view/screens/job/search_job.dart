import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/clients/client_detail_screen.dart';
import 'package:crm_mrs_app/view/screens/dashboard/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchJobs extends StatefulWidget {
  @override
  _SearchJobsState createState() => _SearchJobsState();
}

class _SearchJobsState extends State<SearchJobs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedSegment = 1; // Default to "Week" segment
  DateTime _selectedDate = DateTime.now();
  // Static list of clients
  final List<Map<String, String>> clients = [];

  // Filtered list for search functionality
  List<Map<String, String>> filteredClients = [];

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
        filteredClients = clients
            .where((client) =>
                client['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              () => BottomNavBar(),
            );
          },
        ),
        titleSpacing: 0, // Closer title to the leading icon
        title: Text(
          'Jobs',
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
      body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: marginSet, horizontal: marginLR),
          child: Column(
            children: [
              _buildDatePicker(),
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
              filteredClients.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: filteredClients.length,
                        itemBuilder: (context, index) {
                          final client = filteredClients[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                client['name']![0],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(client['name']!),
                            subtitle: client['email'] != null
                                ? Text(client['email']!)
                                : null,
                            trailing: GestureDetector(
                              child: Icon(Icons.more_vert),
                              onTap: () {},
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ClientDetailScreen(client: client),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  : Padding(
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
            ],
          )),
    );
  }

  Widget _buildDatePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(marginSet),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              borderRadius: BorderRadiusDirectional.circular(roundCardView)),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: _handlePrevious,
          ),
        ),
        Text(
          _getDisplayText(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          margin: EdgeInsets.all(marginSet),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              borderRadius: BorderRadiusDirectional.circular(roundCardView)),
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: _handleNext,
          ),
        ),
      ],
    );
  }

  String _getDisplayText() {
    return DateFormat('MMM yyyy').format(_selectedDate); // Month format
    // if (_selectedSegment == 0) {
    //   return DateFormat('MMM d').format(_selectedDate); // Day format
    // } else if (_selectedSegment == 1) {
    //   DateTime startOfWeek =
    //       _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
    //   DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
    //   return "${DateFormat('MMM d').format(startOfWeek)} - ${DateFormat('MMM d').format(endOfWeek)}"; // Week format

    // } else {
    //   return DateFormat('MMM yyyy').format(_selectedDate); // Month format
    // }
  }

  void _handlePrevious() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month - 1, 1); // Previous month
    });
  }

  void _handleNext() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month + 1, 1); // Next month
    });
  }
}
