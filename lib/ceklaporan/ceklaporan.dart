import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';

import 'laporan.dart'; // Impor halaman laporan

class CekLaporan extends StatefulWidget {
  @override
  _CekLaporanState createState() => _CekLaporanState();
}

class _CekLaporanState extends State<CekLaporan> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> jobList = [
    {'title': 'Perbaikan lobby Gedung ADJH', 'location': 'Kab. Bandung'},
    {'title': 'Pembuatan pondasi tahap 1', 'location': 'Kota Bekasi'},
    {'title': 'Pembuatan pondasi lanjutan', 'location': 'Kota Bekasi'},
    {'title': 'Maintenance elektrikal Gedung B', 'location': 'Kota Jakarta Pusat'},
  ];

  // List to store filtered job list
  List<Map<String, String>> filteredJobList = [];

  @override
  void initState() {
    super.initState();
    // Initialize filtered list with the original list
    filteredJobList = jobList;
    searchController.addListener(() {
      filterJobs();
    });
  }

  void filterJobs() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredJobList = jobList
          .where((job) => job['title']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4147D5), size: 30),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardPage(), // Navigasi ke halaman HomePage
              ),
            );
          },
        ),
        title: const Text(
          'Cek Laporan',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24, // Ukuran font disesuaikan
            color: Color(0xFF4147D5),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF4147D5), width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari daftar laporan',
                    prefixIcon: Icon(Icons.search, color: Color(0xFF4147D5)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                ),
              ),
            ),
            // Dynamic List of jobs
            Expanded(
              child: ListView.builder(
                itemCount: filteredJobList.length,
                itemBuilder: (context, index) {
                  final job = filteredJobList[index];
                  return Column(
                    children: [
                      _buildJobItem(
                        context: context,
                        title: job['title']!,
                        subtitle: job['location']!,
                      ),
                      if (index < filteredJobList.length - 1) Divider(), // Add divider between jobs
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build each job item with navigation
  Widget _buildJobItem({required BuildContext context, required String title, required String subtitle}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Color(0xFF4147D5)), // Change color to #4147D5
      onTap: () {
        // Navigate to Laporan page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Laporan(), // Navigasi tanpa parameter
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}