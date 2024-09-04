// Get.to(
//             () => Dashboard(),
//           );

import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/dashboard/BottomBarScreen/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Add this dependency for date formatting

class TimeSheetsScreen extends StatefulWidget {
  @override
  _TimeSheetsScreenState createState() => _TimeSheetsScreenState();
}

class _TimeSheetsScreenState extends State<TimeSheetsScreen> {
  int _selectedSegment = 1; // Default to "Week" segment
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: applightcolor,
        title: Text(
          "Timesheets",
          style: TextStyle(
              color: appcolor,
              fontWeight: FontWeight.w600,
              fontSize: smFontSize),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: appcolor,
          ),
          onPressed: () {
            // Add your back navigation here
            Get.to(
              () => Dashboard(),
            );
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: _buildSegmentedControl()),
          SizedBox(height: 16),
          _buildDatePicker(),
          SizedBox(height: 16),
          Text(
            "Total: 00:00 hours",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 16),
          Divider(),
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
          _buildSegmentButton("Day", 0),
          _buildSegmentButton("Week", 1),
          _buildSegmentButton("Month", 2),
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
    if (_selectedSegment == 0) {
      return DateFormat('MMM d').format(_selectedDate); // Day format
    } else if (_selectedSegment == 1) {
      DateTime startOfWeek =
          _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
      DateTime endOfWeek = startOfWeek.add(Duration(days: 6));
      return "${DateFormat('MMM d').format(startOfWeek)} - ${DateFormat('MMM d').format(endOfWeek)}"; // Week format
    } else {
      return DateFormat('MMM yyyy').format(_selectedDate); // Month format
    }
  }

  void _handlePrevious() {
    setState(() {
      if (_selectedSegment == 0) {
        _selectedDate =
            _selectedDate.subtract(Duration(days: 1)); // Previous day
      } else if (_selectedSegment == 1) {
        _selectedDate =
            _selectedDate.subtract(Duration(days: 7)); // Previous week
      } else {
        _selectedDate = DateTime(
            _selectedDate.year, _selectedDate.month - 1, 1); // Previous month
      }
    });
  }

  void _handleNext() {
    setState(() {
      if (_selectedSegment == 0) {
        _selectedDate = _selectedDate.add(Duration(days: 1)); // Next day
      } else if (_selectedSegment == 1) {
        _selectedDate = _selectedDate.add(Duration(days: 7)); // Next week
      } else {
        _selectedDate = DateTime(
            _selectedDate.year, _selectedDate.month + 1, 1); // Next month
      }
    });
  }


}
