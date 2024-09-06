import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/view/widgets/dialogs/custom_dialog.dart';
import 'package:flutter/material.dart';
// Add this import for formatting dates and times

class NewClientPage extends StatefulWidget {
  @override
  _NewClientPageState createState() => _NewClientPageState();
}

class _NewClientPageState extends State<NewClientPage> {
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
    double scWidth = MediaQuery.of(context).size.width;
    double scHeight = MediaQuery.of(context).size.height;
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
          'Client Details',
          style: TextStyle(
              color: appcolor,
              fontWeight: FontWeight.w600,
              fontSize: exSmFontSize),
        ),
      ),
      body: Container(
        height: scHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: scHeight / 1.3,
                child: ListView(
                  children: [
                    // Client details section

                    buildClientDetailsSection(),
                    SizedBox(height: 5),

                    // Service location section

                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Create job button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: appcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(roundBtn),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Save', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClientDetailsSection() {
    return Column(
      children: [
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
}
