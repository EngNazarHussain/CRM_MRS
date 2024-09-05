import 'package:crm_mrs_app/constant.dart';
import 'package:flutter/material.dart';

class ClientDetailScreen extends StatelessWidget {
  final Map<String, String> client;

  ClientDetailScreen({required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          client['name'] ?? '',
          style: TextStyle(color: appcolor),
        ),
        backgroundColor: applightcolor, // Match the design color
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: appcolor,
          ),
          onPressed: () {
            // Action to perform when 'Okay' is pressed
            Navigator.of(context).pop(); // Navigate to the previous page
            print('Okay button pressed!');
            print(
              'clicked',
            );
          },
        ),
        titleSpacing: 0, // Closer title to the leading icon
      ),
      body: SingleChildScrollView(
        child: Container(
          color: greyColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Client Name and Contact Information
              Container(
                color: dfColor,
                padding: EdgeInsets.symmetric(
                    horizontal: marginLR + marginLR, vertical: marginLR),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          client['name'] ?? '',
                          style: TextStyle(
                              fontSize: smFontSize - 2,
                              fontWeight: FontWeight.w600,
                              color: btnTextColor),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: btnTextColor,
                          size: smFontSize,
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '(832) 815-1295  |  office@mrsgaragedoor.com',
                          style: TextStyle(
                              fontSize: exXSmFontSize,
                              color: btnTextLightColor),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30, // Adjust the size as needed
                              height: 30, // Adjust the size as needed
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: btnTextColor
                                      .withOpacity(.1), // Set the ring color
                                  width: 2.0, // Set the ring thickness
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.call_outlined,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 30, // Adjust the size as needed
                              height: 30, // Adjust the size as needed
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: btnTextColor
                                      .withOpacity(.1), // Set the ring color
                                  width: 2.0, // Set the ring thickness
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.message_outlined,
                                  size: 20, // Adjust the icon size as needed
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    Divider(),
                    SizedBox(height: 16),

                    // Revenue and Due Information
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total revenue:',
                              style: TextStyle(
                                  fontSize: exSmFontSize,
                                  color: btnTextColor,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              ' \$0.00',
                              style: TextStyle(
                                  fontSize: exXSmFontSize,
                                  color: btnTextLightColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Due:',
                              style: TextStyle(
                                  fontSize: exSmFontSize,
                                  color: btnTextColor,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              ' \$0.00',
                              style: TextStyle(
                                  fontSize: exXSmFontSize,
                                  color: btnTextLightColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              
              SizedBox(height: 18),

              // Main Address Section
              Container(
                  color: dfColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: marginLR + marginLR, vertical: marginLR),
                  child: Expanded(
                   
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Main address'),
                        _buildAddressInfo(
                            '5043 glenmeadow dr, houston, Texas 77096'),
  Divider(), // Line separator

                        // Billing Address Section
                        SizedBox(height: 16),
                        _buildSectionTitle('Billing address'),
                        _buildAddressInfo(
                            '5043 glenmeadow dr, houston, Texas 77096'),

                        SizedBox(height: 16),
                        Divider(color: Colors.grey), // Line separator

                        // Jobs, Invoices, Estimates, Client Notes
                        _buildListTile('Jobs', '0'),
                          Divider(), // Line separator

                        _buildListTile('Invoices', '0'),
                          Divider(), // Line separator

                        _buildListTile('Estimates', '1'),
                          Divider(), // Line separator

                        _buildListTile('Client notes', '0'),
                          Divider(), // Line separator

                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build section titles like "Main Address" and "Billing Address"
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: dfFontSize, fontWeight: FontWeight.bold),
    );
  }

  // Method to build address information
  Widget _buildAddressInfo(String address) {
    return Row(
      children: [
        Icon(Icons.location_on, color: Colors.grey),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            address,
            style: TextStyle(fontSize: exSmFontSize-2, color: btnTextLightColor),
          ),
        ),
         Icon(Icons.arrow_forward_ios, color: Colors.grey, size: dfIconSize-5,),
      ],
    );
  }

  // Method to build list tiles for Jobs, Invoices, Estimates, Client Notes
  Widget _buildListTile(String title, String count) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: _getIconForTitle(title),
      title: Text(title+' ($count)'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         // Text('($count)'),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: dfIconSize-5,),
         // Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  // Method to get corresponding icons for each section
  Icon _getIconForTitle(String title) {
    switch (title) {
      case 'Jobs':
        return Icon(Icons.work, color: Colors.grey,);
      case 'Invoices':
        return Icon(Icons.receipt, color: Colors.grey);
      case 'Estimates':
        return Icon(Icons.assessment, color: Colors.grey);
      case 'Client notes':
        return Icon(Icons.note, color: Colors.grey);
      default:
        return Icon(Icons.info, color: Colors.grey);
    }
  }
}
