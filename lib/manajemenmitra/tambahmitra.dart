import 'package:flutter/material.dart';

import 'ManajemenMitra.dart'; // Import ManajemenMitra screen

class TambahMitra extends StatefulWidget {
  @override
  _TambahMitraState createState() => _TambahMitraState();
}

class _TambahMitraState extends State<TambahMitra> {
  int _currentIndex = 0; // To manage navbar selection

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Navbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Informasi Mitra",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: _currentIndex == 0
                              ? Color(0xFF4147D5)
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        color: _currentIndex == 0
                            ? Color(0xFF4147D5)
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Detail Kontrak",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: _currentIndex == 1
                              ? Color(0xFF4147D5)
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        color: _currentIndex == 1
                            ? Color(0xFF4147D5)
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Akun Pengguna",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: _currentIndex == 2
                              ? Color(0xFF4147D5)
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        color: _currentIndex == 2
                            ? Color(0xFF4147D5)
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Display the content for Informasi Mitra
            if (_currentIndex == 0) ...[
              // Perusahaan
              Text(
                "Perusahaan",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Increased font size
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFFFFF), // White
                  hintText: "Nama perusahaan",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Alamat
              Text(
                "Alamat Perusahaan",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  hintText: "Alamat perusahaan",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Other fields for Informasi Mitra
              // ...
              Text(
                "Nomor Telepon Perusahaan",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  hintText: "Ketik Disini",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],

            // Display the content for Akun Pengguna
            if (_currentIndex == 2) ...[
              // Nama Lengkap
              Text(
                "Nama Lengkap",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  hintText: "Nama Lengkap",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Email
              Text(
                "Email",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Nomor Telepon
              Text(
                "Nomor Telepon",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  hintText: "Nomor Telepon",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4147D5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],

            Spacer(),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4147D5), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    // Increment the current index to switch to the next tab
                    _currentIndex = (_currentIndex + 1) % 3; // 3 is the number of tabs
                  });
                },
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}