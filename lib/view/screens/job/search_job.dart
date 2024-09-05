import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/screens/clients/client_detail_screen.dart';
import 'package:crm_mrs_app/view/screens/dashboard/bottomNavBar.dart';
import 'package:crm_mrs_app/view/screens/job/new_job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:ui'; // Import this for TextDirection

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
  bool _isFilterOpen = false; // State to track filter visibility

  // Dummy data for the dropdowns
  List<String> statusOptions = [
    'Submitted',
    'In Progress',
    'Pending',
    'Done Pending Approval',
    'Canceled',
    'Done'
  ];
  List<String> tagOptions = ['Callback', 'Estimate', 'Followup', 'Opportunity'];
  List<String> teamOptions = ['Just me', 'Totem Sinal', 'Usman'];
  List<String> scheduleOptions = [
    'Scheduled',
    'Unscheduled',
  ];

  // Track selected values
  List<String> selectedStatus = [];
  List<String> selectedTags = [];
  List<String> selectedTeams = [];
  List<String> selectedSchedules = [];
  String? _selectedSchedule;
// Helper function to determine background color based on the option value
  Color getColorForOption(String option) {
    switch (option) {
      case 'Callback':
        return Colors.red;
      case 'Estimate':
        return Colors.deepPurple;
      case 'Followup':
        return Colors.orange;
      case 'Opportunity':
        return Colors.green;
      default:
        return Colors.transparent; // Default color if no match
    }
  }

// Helper function to calculate the width of the text
// Function to calculate text width using Flutter's TextDirection

// double getTextWidth(String text, double fontSize) {
//   final TextPainter textPainter = TextPainter(
//     text: TextSpan(
//       text: text,
//       style: TextStyle(fontSize: fontSize),
//     ),
//     maxLines: 1,
//     textDirection: TextDirection.ltr, // Use TextDirection.ltr from material.dart
//   )..layout(minWidth: 0, maxWidth: double.infinity);

//   return textPainter.size.width;
// }

  // Function to show bottom sheet for dropdown with checkboxes
  void _showDropdownSheet(
      List<String> options,
      String title,
      List<String> selectedOptions,
      ValueChanged<List<String>> onSelectionChanged) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(marginLR),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(marginLR + 5),
                    width: 40.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      options[0] == 'Scheduled' || options == 'Unscheduled'
                          ? Container() // Empty container when `currentOption` is 'Schedule'
                          : Container(
                              margin: EdgeInsets.only(left: marginLR + 3),
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: dfFontSize,
                                    fontWeight: FontWeight.w600,
                                    color: btnTextColor),
                              ),
                            ),
                      options[0] == 'Scheduled' || options == 'Unscheduled'
                          ? Container() // Empty container when `currentOption` is 'Schedule'
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selectedOptions.length ==
                                      options.length) {
                                    selectedOptions.clear();
                                  } else {
                                    selectedOptions.clear();
                                    selectedOptions.addAll(options);
                                  }
                                });
                                onSelectionChanged(selectedOptions);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: marginSet),
                                child: Text(
                                  selectedOptions.length == options.length
                                      ? 'Deselect all'
                                      : 'Select all',
                                  style: TextStyle(
                                      fontSize: dfFontSize - 2,
                                      fontWeight: FontWeight.w600,
                                      color: btnTextLightColor),
                                ),
                              ),
                            ),
                    ],
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        final option = options[index];
                        final isSelected = selectedOptions.contains(option);

                        return ListTile(
                          title: Container(
                            padding: EdgeInsets.all(
                                8.0), // Add some padding for better appearance
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(roundCardView),
                              color: getColorForOption(option),
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                color: getColorForOption(option) ==
                                        Colors.transparent
                                    ? Colors
                                        .black // Text color black if background is transparent
                                    : Colors.white, // Default text color
                                fontSize: 16,
                              ),
                            ),
                          ),
                          trailing: options[0] == 'Scheduled' ||
                                  options == 'Unscheduled'
                              ? Radio<String>(
                                  value:
                                      option, // Use the option value directly
                                  groupValue: _selectedSchedule,
                                  onChanged: (String? value) {
                                    setState(() {
                                      if (_selectedSchedule == value) {
                                        // Deselect if the same value is clicked again
                                        _selectedSchedule = null;
                                      } else {
                                        // Select the new value
                                        _selectedSchedule = value;
                                      }
                                    });
                                  },
                                )
                              : Checkbox(
                                  value: isSelected,
                                  onChanged: (bool? checked) {
                                    setState(() {
                                      if (checked == true) {
                                        selectedOptions.add(option);
                                      } else {
                                        selectedOptions.remove(option);
                                      }
                                    });
                                    onSelectionChanged(selectedOptions);
                                  },
                                ),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 350,
                    padding: EdgeInsets.all(marginSet + 5),
                    decoration: BoxDecoration(
                        color: appcolor,
                        borderRadius: BorderRadius.circular(roundBtn)),
                    margin: EdgeInsets.all(marginSet),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: dfFontSize - 2,
                          fontWeight: FontWeight.w600,
                          color: btnTextLightColor),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

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
            Get.to(() => BottomNavBar());
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
              Get.to(() => NewJobPage());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.filter_alt_outlined,
              color: appcolor,
            ),
            onPressed: () {
              setState(() {
                _isFilterOpen = !_isFilterOpen;
              });
            },
          ),
        ],
        backgroundColor: applightcolor,
        bottom: _isFilterOpen
            ? PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: Column(
                  children: [
                    Divider(),
                    Container(
                      color: applightcolor,
                      padding: EdgeInsets.symmetric(
                          horizontal: marginSet, vertical: marginSet + 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Status Dropdown Trigger
                          GestureDetector(
                            onTap: () => _showDropdownSheet(
                              statusOptions,
                              'Status',
                              selectedStatus,
                              (value) {
                                setState(() {
                                  selectedStatus = value;
                                });
                              },
                            ),
                            child: DropdownChip(label: 'Status'

                                // selectedStatus.isEmpty
                                //     ? 'Status'
                                //     : selectedStatus.join(', '),
                                ),
                          ),
                          // Tags Dropdown Trigger
                          GestureDetector(
                            onTap: () => _showDropdownSheet(
                              tagOptions,
                              'Tags',
                              selectedTags,
                              (value) {
                                setState(() {
                                  selectedTags = value;
                                });
                              },
                            ),
                            child: DropdownChip(label: 'Tags'

                                // selectedTags.isEmpty
                                //     ? 'Tags'
                                //     : selectedTags.join(', '),
                                ),
                          ),
                          // Team Dropdown Trigger
                          GestureDetector(
                            onTap: () => _showDropdownSheet(
                              teamOptions,
                              'Team',
                              selectedTeams,
                              (value) {
                                setState(() {
                                  selectedTeams = value;
                                });
                              },
                            ),
                            child: DropdownChip(label: 'Team'
                                // selectedTeams.isEmpty
                                //     ? 'Team'
                                //     : selectedTeams.join(', '),
                                ),
                          ),
                          // Schedule Type Dropdown Trigger
                          GestureDetector(
                            onTap: () => _showDropdownSheet(
                              scheduleOptions,
                              'Schedule Type',
                              selectedSchedules,
                              (value) {
                                setState(() {
                                  selectedSchedules = value;
                                });
                              },
                            ),
                            child: DropdownChip(label: 'Schedule Type'
                                // selectedSchedules.isEmpty
                                //     ? 'Schedule Type'
                                //     : selectedSchedules.join(', '),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: marginLR, horizontal: marginLR),
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
                      borderRadius: BorderRadius.circular(12.0),
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

class DropdownChip extends StatelessWidget {
  final String label;

  const DropdownChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: greyColor.withOpacity(.4),
        ),
      ),
      child: Row(
        children: [
          Text(label,
              style: TextStyle(
                  color: dfColor,
                  fontSize: exXSmFontSize,
                  fontWeight: FontWeight.w700)),
          Icon(Icons.arrow_drop_down, color: dfColor),
        ],
      ),
    );
  }
}
