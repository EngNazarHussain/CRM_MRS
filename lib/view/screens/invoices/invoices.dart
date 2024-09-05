import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/clients/client_detail_screen.dart';
import 'package:crm_mrs_app/view/screens/dashboard/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchInvoices extends StatefulWidget {
  @override
  _SearchInvoicesState createState() => _SearchInvoicesState();
}

class _SearchInvoicesState extends State<SearchInvoices> {
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
          'Invoices',
          style: TextStyle(color: appcolor),
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
}
