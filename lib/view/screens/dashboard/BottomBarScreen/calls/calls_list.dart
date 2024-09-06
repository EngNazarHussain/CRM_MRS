import 'package:crm_mrs_app/constant.dart';
import 'package:flutter/material.dart';
// Add this dependency for date formatting

class CallListScreen extends StatefulWidget {
  @override
  _CallListScreenState createState() => _CallListScreenState();
}

class _CallListScreenState extends State<CallListScreen> {
  int _selectedSegment = 1; // Default to "Week" segment
  DateTime _selectedDate = DateTime.now();
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Create GlobalKey
  @override
  Widget build(BuildContext context) {
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.format_align_left_rounded,
            color: appcolor,
          ),
          onPressed: () {
            print('clicked');
            _scaffoldKey.currentState
                ?.openDrawer(); // Use the key to open the drawer
          },
        ),
        titleSpacing: 0, // Closer title to the leading icon
        title: Text(
          'Calls',
          style: TextStyle(
            color: appcolor,
            fontSize: smFontSize - 1,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [],
        backgroundColor: applightcolor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Column(
            children: [
              // Divider(),
              Container(
                height: 50,
                width: scWidth,
                color: applightcolor,
                padding: EdgeInsets.symmetric(
                    horizontal: marginSet, vertical: marginSet + 2),
                child: _buildSegmentedControl(),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ic_search.png', // Replace with your asset path
                    height: 120,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "No results found",
                    style: TextStyle(
                        fontSize: dfFontSize,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          // border: Border.all(
          //   color: Colors.grey[300],
          // ),
          borderRadius: BorderRadius.all(
            Radius.circular(roundCardView + 5),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSegmentButton("All", 0),
          _buildSegmentButton("Missed", 1),
          _buildSegmentButton("Voicemail", 2),
        ],
      ),
    );
  }

  Widget _buildSegmentButton(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSegment = index;
            _selectedDate = DateTime.now(); // Reset date to today
          });
        },
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              color: _selectedSegment == index ? dfColor : Colors.grey[300],
              // border: Border.all(
              //   color: Colors.grey[300],
              // ),
              borderRadius: BorderRadius.all(
                Radius.circular(marginSet),
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: _selectedSegment == index
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
