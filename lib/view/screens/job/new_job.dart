import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for formatting dates and times

class NewJobPage extends StatefulWidget {
  @override
  _NewJobPageState createState() => _NewJobPageState();
}

class _NewJobPageState extends State<NewJobPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  // Boolean to track the switch state
  bool isSwitchOn = false;

  // Function to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Function to pick a time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: applightcolor,
        leading: IconButton(
          icon: Icon(
            Icons.close_outlined,
            color: appcolor,
          ),
          onPressed: () {
            CustomAlertDialog(
              context,
              title: 'Leave Page',
              dialogType: DialogType.noHeader,
              description: 'Changes you may made may not be saved.',
              function: () {
                // Action to perform when 'Okay' is pressed
                Navigator.of(context).pop(); // Navigate to the previous page
                print('Okay button pressed!');
              },
            );
          },
        ),
        title: Text(
          'New job',
          style: TextStyle(
              color: appcolor,
              fontWeight: FontWeight.w600,
              fontSize: exSmFontSize),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Client details section
            Text('Client details', style: TextStyle(color: btnTextColor)),
            SizedBox(height: 5),
            buildClientDetailsSection(),
            SizedBox(height: 5),

            // Service location section
            Text('Service location', style: TextStyle(color: btnTextColor)),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
            ),
            SizedBox(height: 24),

            // Job details section
            Text('Job details', style: TextStyle(color: btnTextColor)),
            SizedBox(height: 8),
            buildJobDetailsSection(),
            SizedBox(height: 24),

            // Schedule section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Schedule', style: TextStyle(color: btnTextColor)),
                Switch(
                  activeColor: Colors.blue,
                  value: isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = value; // Toggle the switch state
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            buildScheduleSection(),
            SizedBox(height: 24),

            // Create job button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: appcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(roundBtn),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Create job', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClientDetailsSection() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Select existing client',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'First name',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Last name',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Client company name',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email address',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ext #',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            ),
            label: Text(
              'Add number',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildJobDetailsSection() {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Job type',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          items: [
            DropdownMenuItem(value: 'Job type 1', child: Text('Job type 1')),
            DropdownMenuItem(value: 'Job type 2', child: Text('Job type 2')),
          ],
          onChanged: (value) {},
        ),
        SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Ad source',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          items: [
            DropdownMenuItem(value: 'Source 1', child: Text('Source 1')),
            DropdownMenuItem(value: 'Source 2', child: Text('Source 2')),
          ],
          onChanged: (value) {},
        ),
        SizedBox(height: 16),
        TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
            labelText: 'Job description',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
        ),
      ],
    );
  }

  Widget buildScheduleSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Start date',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
                onTap: () => _selectDate(context), // Open date picker on tap
                controller: TextEditingController(
                  text: selectedDate != null
                      ? DateFormat.yMMMd().format(selectedDate!)
                      : '',
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Start time',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.access_time),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
                onTap: () => _selectTime(context), // Open time picker on tap
                controller: TextEditingController(
                  text:
                      selectedTime != null ? selectedTime!.format(context) : '',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
