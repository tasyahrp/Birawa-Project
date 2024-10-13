import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/buatlaporan/tenagakerja.dart'; // Import TenagaKerjaScreen

class BuatLaporanScreen extends StatelessWidget {
  // Simulating a list of jobs fetched from a database
  final List<Map<String, String>> jobList = [
    {'title': 'Perbaikan lobby Gedung ADJH', 'location': 'Kab. Bandung'},
    {'title': 'Pembuatan pondasi tahap 1', 'location': 'Kota Bekasi'},
    {'title': 'Pembuatan pondasi lanjutan', 'location': 'Kota Bekasi'},
    {'title': 'Maintenance elektrikal Gedung B', 'location': 'Kota Jakarta Pusat'},
    // Add more job data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: Icon(Icons.arrow_back, color: Color(0xFF4147D5)), // Ikon panah kembali
            ),
            SizedBox(width: 10),
            Text(
              'Buat Laporan',
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Color(0xFF4147D5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove back button (custom back icon used)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header "Pekerjaan"
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              width: double.infinity, // Make the box take full width
              decoration: BoxDecoration(
                color: Color(0xFFEDF1FF), // Light blue background
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Pekerjaan',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Dynamic List of jobs
            Expanded(
              child: ListView.builder(
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  final job = jobList[index];
                  return Column(
                    children: [
                      _buildJobItem(
                        context: context,
                        title: job['title']!,
                        subtitle: job['location']!,
                      ),
                      if (index < jobList.length - 1) Divider(), // Add divider between jobs
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
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        // Navigate to TenagaKerjaScreen when a job is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TenagaKerjaScreen(jobTitle: title),
          ),
        );
      },
    );
  }
}
