import 'package:crm_mrs_app/constant.dart';
import 'package:flutter/material.dart';



class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> with SingleTickerProviderStateMixin {
  int selectedDateIndex = 0;
  final List<String> dates = ["1", "2", "3", "4", "5", "6", "7"];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'September',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 18,
              ),
            ),
          
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            color: Colors.yellow,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.sync),
            color: Colors.yellow,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.yellow,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.yellow,
              labelColor: Colors.blue,
              unselectedLabelColor: btnTextLightColor,
              
              tabs: [
                Tab(text: "Timeline", ),
                Tab(text: "Day"),
                Tab(text: "Week"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 60,
                  color: Colors.grey[200],
                  child: ListView.builder(
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDateIndex = index;
                          });
                        },
                        child: Container(
                          color: selectedDateIndex == index ? Colors.white : Colors.grey[200],
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              dates[index],
                              style: TextStyle(
                                color: selectedDateIndex == index ? Colors.green : Colors.black,
                                fontWeight: selectedDateIndex == index ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: selectedDateIndex == 2
                        ? [
                            buildJobCard(
                                'JOB #14', '1:00 PM - 3:00 PM', 'Service', 'Oni Banki', '13222 Sleepy Creek Meadows, Houston, Texas, 77083'),
                            buildJobCard(
                                'JOB #21', '1:00 PM - 3:00 PM', 'Repair', 'Tom Robinson', '7902 Bentlake Cir, Missouri City, Texas, 77459'),
                            buildJobCard(
                                'JOB #20', '2:00 PM - 4:00 PM', 'Service', 'Diego Conti', '1598 Sandpiper Cir, Weston, Florida, 33327'),
                          ]
                        : [
                            buildJobCard(
                                'JOB #11', '10:00 AM - 12:00 PM', 'Service', 'Alice Smith', '456 Willow Ave, Dallas, Texas, 75201'),
                            buildJobCard(
                                'JOB #22', '3:00 PM - 5:00 PM', 'Repair', 'John Doe', '789 Oak St, Austin, Texas, 78701'),
                          ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildJobCard(String jobNumber, String time, String type, String name, String address) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobNumber,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(time),
            SizedBox(height: 5),
            Text(type),
            SizedBox(height: 5),
            Text(name),
            SizedBox(height: 5),
            Text(address),
          ],
        ),
      ),
    );
  }
}
