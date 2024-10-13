import 'package:flutter/material.dart';
import 'package:flutter_application_1/buatlaporan/mainlaporan.dart';
import 'package:flutter_application_1/manajemenmitra/manajemenmitra.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Image.asset('assets/images/logo.png', height: 40),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications, color: Colors.black),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Info perusahaan & cuaca
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFECEAFF),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.account_circle, size: 50, color: Colors.grey),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PT. Bangun Negeri Selalu",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Jakarta",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(Icons.wb_sunny, size: 50, color: Colors.orange),
                            Text(
                              "27°C",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Menu buttons and background
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF4147D5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMenuButton(context, Icons.people, 'Mnj Mitra', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ManajemenMitra()),
                          );
                        }),
                        _buildMenuButton(context, Icons.note_add, 'Buat Laporan', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BuatLaporanScreen()),
                          );
                        }),
                        _buildMenuButton(context, Icons.file_copy, 'Cek Laporan', () {}),
                        _buildMenuButton(context, Icons.mail, 'Kotak Masuk', () {}),
                      ],
                    ),
                  ),
                  // Log Aktivitas with blue background
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Log Aktivitas",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Icon(Icons.open_in_new, color: Colors.white),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(4),
                              2: FlexColumnWidth(3),
                            },
                            border: TableBorder.all(color: Colors.grey[300]!),
                            children: [
                              _buildTableRow("Timestamp", "Keterangan", "User", isHeader: true),
                              _buildTableRow("Rabu", "Membuat laporan aktivitas pekerjaan pembuatan din...", "PT. Bangun Negeri Selalu"),
                              _buildTableRow("Rabu", "Membuat laporan aktivitas pekerjaan pembuatan din...", "PT. Bangun Negeri Selalu"),
                              _buildTableRow("Rabu", "Membuat laporan aktivitas pekerjaan pembuatan din...", "PT. Bangun Negeri Selalu"),
                              _buildTableRow("Rabu", "Membuat laporan aktivitas pekerjaan pembuatan din...", "PT. Bangun Negeri Selalu"),
                              _buildTableRow("Rabu", "Membuat laporan aktivitas pekerjaan pembuatan din...", "PT. Bangun Negeri Selalu"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Helpdesk
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.help_outline),
                        backgroundColor: Color.fromARGB(255, 220, 220, 228),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Footer inside blue box
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Developed By Telkom University",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat tombol menu
  Widget _buildMenuButton(BuildContext context, IconData icon, String label, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(icon, color: Color(0xFF4147D5), size: 30),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat baris tabel
  TableRow _buildTableRow(String timestamp, String description, String user, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(
        color: isHeader ? Color(0xFFEEEEEE) : null,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            timestamp,
            style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            user,
            style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
