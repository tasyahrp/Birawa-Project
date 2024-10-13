import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import ini diperlukan untuk TapGestureRecognizer
import 'package:google_fonts/google_fonts.dart';
import 'login.dart'; // Adjust import as needed for your project

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();

  void _showNotification(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Email telah terkirim, jika tidak ada cek folder spam.',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF4147D5), // Warna biru sesuai gambar
      behavior: SnackBarBehavior.floating, // Membuat SnackBar floating (tidak di bawah)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        label: 'X',
        textColor: Colors.white,
        onPressed: () {
          // Dismiss the SnackBar if the user clicks 'X'
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Logo Telkom Property
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png', // Adjust path as needed
                    width: 200,
                    height: 165,
                  ),
                ),
              ),
              SizedBox(height: 20), // Space between logo and form
              // Blue Background
              Expanded(
                child: Stack(
                  children: [
                    // First Layer (Lighter Blue slightly above the darker blue)
                    Positioned(
                      left: 15,
                      right: 15,
                      top: 50, // Menambahkan jarak dari atas untuk menurunkan posisi biru
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.55, // Adjust as needed
                        decoration: BoxDecoration(
                          color: Color(0x7D4747D5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    // Second Layer (Darker Blue)
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 64, // Menambahkan jarak agar lebih rendah dari layer pertama
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.55, // Adjust as needed
                        decoration: BoxDecoration(
                          color: Color(0xFF4147D5), // Darker blue color
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Lupa Password',
                                  style: GoogleFonts.poppins(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  'Masukan email perusahaan yang terdaftar\npada Birawa untuk reset password.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // Untuk memastikan label berada di kiri
                                children: [
                                  Text(
                                    'Email', // Tulisan di luar kotak
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8), // Jarak antara label dan TextField
                                  TextField(
                                    controller: _emailController,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Ketik di sini', // Placeholder di dalam TextField
                                      hintStyle: TextStyle(color: Colors.black45),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Warna border
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Warna border saat enabled
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black, // Warna border saat focused
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              // Kirim Button
                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Tampilkan notifikasi setelah tombol Kirim ditekan
                                    _showNotification(context);
                                  },
                                  child: Text(
                                    'Kirim',
                                    style: GoogleFonts.poppins(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white, // Button background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Tiba-tiba inget? ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: 'Masuk di sini.',
                                        style: TextStyle(
                                          color: Colors.yellowAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => LoginScreen()),
                                            );
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(), // Pushes the footer to the bottom
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Text(
                                    'Developed by Telkom University',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16, color: Colors.white70),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
