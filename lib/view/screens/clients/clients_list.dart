import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/clients/client_detail_screen.dart';
import 'package:flutter/material.dart';

class ClientsListScreen extends StatefulWidget {
  @override
  _ClientsListScreenState createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
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
    filteredClients = clients;
  }

  void _filterClients(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredClients = clients;
      } else {
        filteredClients = clients
            .where((client) =>
                client['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showBottomSheet(BuildContext context, String clientName) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(top: 10.0), // Add padding to the top
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Grey line at the top
              Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              // Adding spacing below the line
              SizedBox(height: 8.0),
              // List of actions
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Call $clientName'),
                onTap: () {
                  Navigator.pop(context);
                  // Add call functionality here
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Send message'),
                onTap: () {
                  Navigator.pop(context);
                  // Add message functionality here
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Schedule a job'),
                onTap: () {
                  Navigator.pop(context);
                  // Add schedule functionality here
                },
              ),
              ListTile(
                leading: Icon(Icons.receipt),
                title: Text('Create invoice'),
                onTap: () {
                  Navigator.pop(context);
                  // Add create invoice functionality here
                },
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Create estimate'),
                onTap: () {
                  Navigator.pop(context);
                  // Add create estimate functionality here
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_sharp,
            color: appcolor,
          ),
          onPressed: () {
            print('clicked');
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        titleSpacing: 0, // Closer title to the leading icon
        title: Text(
          'Clients',
          style: TextStyle(color: appcolor),
        ),
        backgroundColor: applightcolor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: appcolor,
            ),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: appcolor,
            ),
            onPressed: () {
              // Add action
            },
          ),
        ],
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
                  hintText: '   Search client by name',
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w400),
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
            Expanded(
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
                    subtitle:
                        client['email'] != null ? Text(client['email']!) : null,
                    trailing: GestureDetector(
                      child: Icon(Icons.more_vert),
                      onTap: () {
                        _showBottomSheet(context, client['name']!);
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
