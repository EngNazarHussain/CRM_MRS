// import 'dart:io'; // Import dart:io for File
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class EstimateDetailsScreen extends StatefulWidget {
//   @override
//   _EstimateDetailsScreenState createState() => _EstimateDetailsScreenState();
// }

// class _EstimateDetailsScreenState extends State<EstimateDetailsScreen> {
//   XFile? _image;
//   final ImagePicker _picker = ImagePicker();

//   // Function to pick image from gallery or camera
//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? selectedImage = await _picker.pickImage(source: source);
//       setState(() {
//         _image = selectedImage;
//       });
//     } catch (e) {
//       // Handle any errors here
//       print('Error picking image: $e');
//     }
//   }

//   // Function to show image picker options
//   void _showImagePickerOptions() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading: Icon(Icons.photo_library),
//                 title: Text('Gallery'),
//                 onTap: () {
//                   _pickImage(ImageSource.gallery);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.photo_camera),
//                 title: Text('Camera'),
//                 onTap: () {
//                   _pickImage(ImageSource.camera);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // Widget to build the profile section with image picker
//   Widget _buildProfileSection() {
//     return GestureDetector(
//       onTap: _showImagePickerOptions,
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.grey.shade300,
//             backgroundImage: _image != null
//                 ? FileImage(File(_image!.path)) // Corrected here
//                 : null,
//             child: _image == null
//                 ? Icon(Icons.person, size: 30, color: Colors.black)
//                 : null,
//           ),
//           SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 20,
//                   color: Colors.grey.shade300,
//                   margin: EdgeInsets.only(bottom: 8),
//                 ),
//                 Container(
//                   height: 20,
//                   color: Colors.grey.shade300,
//                   margin: EdgeInsets.only(bottom: 8),
//                 ),
//                 Container(
//                   height: 20,
//                   width: 100,
//                   color: Colors.grey.shade300,
//                 ),
//               ],
//             ),
//           ),
//           Icon(Icons.add, color: Colors.grey),
//         ],
//       ),
//     );
//   }

//   // Other section builders (address, status, etc.)
//   Widget _buildAddressSection() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Text(
//         'Rotem Sinai\n5043 Glenmeadow Dr, Houston, Texas 77066',
//         style: TextStyle(fontSize: 16),
//       ),
//     );
//   }

//   Widget _buildStatusSection() {
//     return ExpansionTile(
//       title: Row(
//         children: [
//           Container(
//             width: 10,
//             height: 10,
//             decoration: BoxDecoration(
//               color: Colors.purple,
//               shape: BoxShape.circle,
//             ),
//           ),
//           SizedBox(width: 8),
//           Text('Status'),
//         ],
//       ),
//       children: <Widget>[
//         ListTile(
//           title: Text('Unsent'),
//         ),
//       ],
//     );
//   }

//   Widget _buildItemsSection() {
//     return ExpansionTile(
//       title: Text('Items'),
//       children: <Widget>[
//         ListTile(
//           title: Text('Item 1'),
//         ),
//         ListTile(
//           title: Text('Item 2'),
//         ),
//       ],
//     );
//   }

//   Widget _buildDepositSection() {
//     return ExpansionTile(
//       title: Row(
//         children: [
//           Icon(Icons.money, color: Colors.green),
//           SizedBox(width: 8),
//           Text('Deposit'),
//         ],
//       ),
//       initiallyExpanded: true,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Replace with your actual asset path or use a network image
//               Image.asset(
//                 'assets/images/ic_search.png',
//                 height: 80,
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'No deposit was set for this estimate',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//               SizedBox(height: 8),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Set estimate deposit',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPaymentsSection() {
//     return ExpansionTile(
//       title: Text('Payments'),
//       initiallyExpanded: true,
//       children: <Widget>[
//         ListTile(
//           title: Text('Payment details here...'),
//         ),
//       ],
//     );
//   }

//   Widget _buildSignaturesSection() {
//     return ExpansionTile(
//       title: Text('Signatures'),
//       initiallyExpanded: true,
//       children: <Widget>[
//         ListTile(
//           title: Text('Signature details here...'),
//         ),
//       ],
//     );
//   }

//   Widget _buildAttachmentsSection() {
//     return ExpansionTile(
//       title: Text('Attachments'),
//       initiallyExpanded: true,
//       children: <Widget>[
//         ListTile(
//           title: Text('Attachment details here...'),
//         ),
//       ],
//     );
//   }

//   Widget _buildNotesSection() {
//     return ExpansionTile(
//       title: Text('Notes (empty)'),
//       initiallyExpanded: true,
//       children: <Widget>[
//         ListTile(
//           title: Text('No notes available.'),
//         ),
//       ],
//     );
//   }

//   // Widget to build bottom buttons
//   Widget _buildBottomButtons() {
//     return Container(
//       color: Colors.white, // Ensures buttons have a solid background
//       padding: EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white,
//               foregroundColor: Colors.black,
//               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               side: BorderSide(color: Colors.grey), // Optional: Add border
//             ),
//             child: Text('Convert to Job'),
//           ),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.yellow[700],
//               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//             ),
//             child: Text('Send to Client'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Estimate 1'),
//         backgroundColor: Color(0xFF333333),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Scrollable content
//           SingleChildScrollView(
//             padding: EdgeInsets.only(bottom: 100), // Padding to avoid overlap
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildProfileSection(),
//                 SizedBox(height: 20),
//                 _buildAddressSection(),
//                 SizedBox(height: 20),
//                 _buildStatusSection(),
//                 _buildItemsSection(),
//                 _buildDepositSection(),
//                 _buildPaymentsSection(),
//                 _buildSignaturesSection(),
//                 _buildAttachmentsSection(),
//                 _buildNotesSection(),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//           // Positioned bottom buttons
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: _buildBottomButtons(),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:crm_mrs_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EstimateDetailsScreen extends StatefulWidget {
  @override
  _EstimateDetailsScreenState createState() => _EstimateDetailsScreenState();
}

class _EstimateDetailsScreenState extends State<EstimateDetailsScreen> {
  File? _image;
  String? expandedSection; // Tracks the currently expanded section
  // XFile? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? selectedImage = await _picker.pickImage(source: source);
      if (selectedImage != null) {
        // Convert XFile to File
        final File imageFile = File(selectedImage.path);
        setState(() {
          _image = imageFile;
        });
      }
    } catch (e) {
      // Handle any errors here
      print('Error picking image: $e');
    }
  }

  String description = '';

  // Function to show image picker options
  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _addDescription() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController descController = TextEditingController();
        return AlertDialog(
          title: Text("Add Description"),
          content: TextField(
            controller: descController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Enter description here...",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  description = descController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Widget buildSection(
      String heading, String content, String btnText, String image) {
    return ExpansionTile(
      title: Row(
        children: [
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
          SizedBox(width: 8),
          Text(
            heading,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
      initiallyExpanded: false,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Replace with your actual asset path or use a network image
              Image.asset(
                image,
                height: 80,
              ),
              SizedBox(height: 16),
              Text(
                'No deposit was set for this estimate',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Set estimate deposit',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: applightcolor,
        title: Text(
          "Estimate 1",
          style: TextStyle(color: appcolor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: appcolor,
          ),
          onPressed: () {
            Navigator.pop(context);
            // Add create estimate functionality here
          },
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: appcolor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //  color: Colors.grey[800],
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap:
                        _showImagePickerOptions, // Trigger image picker on tap
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? Icon(Icons.person, size: 30, color: Colors.black)
                          : null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: dfFontSize, color: btnTextColor),
                        ),
                        description.isNotEmpty
                            ? Text(
                                description,
                                style: TextStyle(
                                    fontSize: 16, color: btnTextColor),
                              )
                            : Container(
                                width: double.infinity,
                                height: 40,
                                color: Colors.grey,
                              ),
                        GestureDetector(
                          onTap: _addDescription, // Add description on tap
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.add, color: Colors.blue.shade400),
                              Text('Add', style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Client Name and Contact Information
            Container(
              margin: EdgeInsets.symmetric(horizontal: marginSet + 5),
              decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(roundCardView)),
              padding: EdgeInsets.symmetric(
                  horizontal: marginLR + marginLR, vertical: marginLR),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'name',
                        style: TextStyle(
                            fontSize: smFontSize + 2,
                            fontWeight: FontWeight.w600,
                            color: btnTextColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'long address of user .......',
                        style: TextStyle(
                            fontSize: exXSmFontSize + 2,
                            color: btnTextLightColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(left: marginLR + 5),
              child: Column(
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                        fontSize: smFontSize,
                        color: btnTextLightColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Example Sections
            buildSection("Items", "Item details here...", 'Add +',
                'assets/images/ic_search.png'),
            buildSection("Deposit", "Deposit details here...", 'Add +',
                'assets/images/ic_search.png'),
            buildSection("Payments", "Payment details here...", 'Add +',
                'assets/images/ic_search.png'),
            buildSection("Signatures", "Signature details here...", 'Add +',
                'assets/images/ic_search.png'),
            buildSection("Attachments", "Attachment details here...", 'Add +',
                'assets/images/ic_search.png'),
            buildSection("Notes (empty)", "Note details here...", 'Add +',
                'assets/images/ic_search.png'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Convert to job",
                  style: TextStyle(color: btnTextColor),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: dfColor,
                  // textStyle: TextStyle(color: blackColor)
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Send to client",
                  style: TextStyle(color: btnTextColor),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
