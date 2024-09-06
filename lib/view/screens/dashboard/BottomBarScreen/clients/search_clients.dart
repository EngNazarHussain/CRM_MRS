import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/dashboard/BottomBarScreen/clients/client_detail_screen.dart';
import 'package:flutter/material.dart';

class SearchClients extends StatefulWidget {
  @override
  _SearchClientsState createState() => _SearchClientsState();
}

class _SearchClientsState extends State<SearchClients> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Static list of clients
  final List<Map<String, String>> clients = [
    {'name': 'Rotem Sinai', 'email': 'office@mrsgaragedoor.com'},
    {'name': 'Taher Wali'},
    {'name': 'Tom Robinson'},
    {'name': 'Diego Conti'},
    {'name': 'Salvador Mata'},
    {'name': 'Phillip K'},
    {'name': 'Albert Chan'},
    {'name': 'Christian D'},
    {'name': 'Ty Lewis'},
    {'name': 'Oni Banki'},
    {'name': 'James'},
    {'name': 'Barry Kale Haygood'},
  ];

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
            Navigator.of(context).pop(); // Navigate to the previous page
          },
        ),
        titleSpacing: 0, // Closer title to the leading icon
        title: Text(
          'Search',
          style: TextStyle(color: appcolor),
        ),
        backgroundColor: applightcolor,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: marginLR, horizontal: marginLR),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: marginLR),
                child: TextField(
                  onChanged: _filterClients,
                  decoration: InputDecoration(
                    hintText: '   Search client, job, invoices..',
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
                            'Find what you need.',
                            style: TextStyle(
                                fontSize: dfFontSize,
                                color: btnTextColor,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'Use the top bar to search.',
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
