import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';

import 'TambahMitra.dart'; // Import the TambahMitra screen

class ManajemenMitra extends StatefulWidget {
  @override
  _ManajemenMitraState createState() => _ManajemenMitraState();
}

class _ManajemenMitraState extends State<ManajemenMitra> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Background color set to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false, // Set title to not be centered
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Color(0xFF4147D5)),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
          );
        },
      ),

        title: Text(
          "Manajemen Mitra",
          style: TextStyle(
            color: Color(0xFF4147D5),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align the column contents to the left
          children: [
            // Search Box + Add Button Row
            Row(
              children: [
                // Search Box
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(color: Color(0xFF4147D5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10), // Margin left for search icon
                          child: Icon(
                            Icons.search,
                            color: Color(0xFF4147D5),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: "Cari mitra, di sini.",
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10), // Space between text field and the button
                // Add Button
                Container(
                  width: 50, // Make the button square
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF), // Button background white
                    borderRadius: BorderRadius.circular(8), // Square with rounded corners
                    border: Border.all(
                      color: Color(0xFF4147D5), // Border color #4147D5
                      width: 2,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Navigate to TambahMitra screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TambahMitra()),
                      );
                    },
                    icon: Icon(
                      Icons.add, // Change to "+" icon
                      color: Color(0xFF4147D5), // Icon color to match border
                      size: 30, // Bigger icon size
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Increased gap between search box and table header
            // Table Header (Nama Mitra and Action)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFFC7D7F0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nama Mitra",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF4147D5),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Action",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF4147D5),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Increased gap between table header and content
            // Placeholder for empty state
            Center(
              child: Text(
                "Tidak ada mitra yang terdaftar.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}