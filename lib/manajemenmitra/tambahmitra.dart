import 'package:flutter/material.dart';

import 'ManajemenMitra.dart'; // Import ManajemenMitra screen

class TambahMitra extends StatefulWidget {
  @override
  _TambahMitraState createState() => _TambahMitraState();
}

class _TambahMitraState extends State<TambahMitra> {
  int _currentIndex = 1; // Start with Detail Kontrak selected
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF4147D5)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManajemenMitra()),
            );
          },
        ),
        title: Text(
          "Tambah Mitra",
          style: TextStyle(
            color: Color(0xFF4147D5),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          // Navbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem("Informasi Mitra", 0),
                _buildNavItem("Detail Kontrak", 1),
                _buildNavItem("Akun Mitra", 2),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey[300]),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_currentIndex == 0) ...[
                      _buildInputField("Perusahaan"),
                      _buildInputField("Alamat Perusahaan"),
                      _buildInputField("Nomor Telepon Perusahaan"),
                    ] else if (_currentIndex == 1) ...[
                      _buildInputField("Nama Kontrak"),
                      _buildInputField("Nomor Kontrak"),
                      _buildDateField(),
                      _buildInputField("Nilai Kontrak"),
                      _buildInputField("Jangka Waktu"),
                      SizedBox(height: 16),
                      _buildSectionTitle("Pekerjaan", "Lokasi"),
                      SizedBox(height: 16),
                      _buildAddJobButton(),
                      SizedBox(height: 80), // Space for fixed button
                    ] else if (_currentIndex == 2) ...[
                      _buildInputField("Nama Lengkap"),
                      _buildInputField("Email"),
                      _buildInputField("Nomor Telepon"),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4147D5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // Handle next action
            setState(() {
              _currentIndex = (_currentIndex + 1) % 3;
            });
          },
          child: Text(
            "Selanjutnya",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, int index) {
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: _currentIndex == index ? Color(0xFF4147D5) : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 2,
            width: 100,
            color: _currentIndex == index ? Color(0xFF4147D5) : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF4147D5)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Ketik di sini",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tanggal Kontrak",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              setState(() => _selectedDate = pickedDate);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF4147D5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate == null ? 'DD/MM/YYYY' : '${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: _selectedDate == null ? Colors.grey : Colors.black,
                  ),
                ),
                Icon(Icons.calendar_today, color: Color(0xFF4147D5)),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSectionTitle(String title1, String title2) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFE8EAFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                title1,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF4147D5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title2,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF4147D5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddJobButton() {
    return Container(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: Icon(Icons.add, color: Color(0xFF4147D5)),
        label: Text(
          "Tambah Pekerjaan",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF4147D5),
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFF4147D5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ), onPressed: (){
        },
      ),
    );
  }
}