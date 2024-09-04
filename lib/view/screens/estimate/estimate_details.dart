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
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EstimateDetailsScreen extends StatefulWidget {
  @override
  _EstimateDetailsScreenState createState() => _EstimateDetailsScreenState();
}

class _EstimateDetailsScreenState extends State<EstimateDetailsScreen> {
  File? _image;
  String? expandedSection; // Tracks the currently expanded section

  final ImagePicker _picker = ImagePicker();
  String description = '';

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Convert XFile to File
      });
    }
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

  Widget buildSection(String section, Widget content) {
    return Column(
      children: [
        ListTile(
          title: Text(section),
          trailing: Icon(expandedSection == section
              ? Icons.expand_less
              : Icons.expand_more),
          onTap: () {
            setState(() {
              expandedSection =
                  expandedSection == section ? null : section; // Toggle section
            });
          },
        ),
        if (expandedSection == section) content,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estimate 1"),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[800],
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _pickImage, // Trigger image picker on tap
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
                        description.isNotEmpty
                            ? Text(
                                description,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )
                            : Container(
                                width: double.infinity,
                                height: 40,
                                color: Colors.grey,
                              ),
                        GestureDetector(
                          onTap: _addDescription, // Add description on tap
                          child: Row(
                            children: [
                              Icon(Icons.add, color: Colors.blue),
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
            SizedBox(height: 16),
            // Example Sections
            buildSection("Items", Text("Item details here...")),
            buildSection("Deposit", Text("Deposit details here...")),
            buildSection("Payments", Text("Payment details here...")),
            buildSection("Signatures", Text("Signature details here...")),
            buildSection("Attachments", Text("Attachment details here...")),
            buildSection("Notes (empty)", Text("Note details here...")),
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
                child: Text("Convert to job"),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Send to client"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
