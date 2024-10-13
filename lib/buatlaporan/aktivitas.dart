import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AktivitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black), // Back arrow
        title: Text(
          'Buat Laporan',
          style: GoogleFonts.poppins(color: Colors.black), // Title in black
        ),
        backgroundColor: Colors.white, // AppBar background color
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title and Date
            Text(
              'Perbaikan lobby Gedung ADJH',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '27/09/2024',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Link Section
            Row(
              children: [
                Text(
                  'Tenaga Kerja > Aktivitas > Cuaca > Final Review',
                  style: GoogleFonts.poppins(color: Colors.blue, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Add Job Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle adding a job
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add), // Plus icon
                    SizedBox(width: 8),
                    Text(
                      'Tambah Pekerjaan',
                      style: GoogleFonts.poppins(color: Colors.blue),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue), // Blue border
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Job List Header
            Text(
              'Daftar Pekerjaan',
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Job List
            Expanded(
              child: ListView(
                children: [
                  _buildJobItem('Pekerjaan Sipil', 'Pemasangan dinding Bata'),
                  _buildJobItem('Pekerjaan Mekanikal Elektrikal', 'Instalasi kabel listrik lantai 1'),
                  _buildJobItem('Pekerjaan Arsitektur', 'Perancangan Model 3D Kabinet'),
                  _buildJobItem('Pekerjaan Furnitur', 'Pemasangan kabinet lantai 2'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build each job item
  Widget _buildJobItem(String category, String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        subtitle: Text(
          category,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
        ),
        trailing: Text(
          'Lihat bukti >',
          style: GoogleFonts.poppins(color: Colors.blue),
        ),
        onTap: () {
          // Handle tap to show more details
        },
      ),
    );
  }
}
