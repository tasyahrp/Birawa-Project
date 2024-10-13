import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart'; // Adjust import as needed for your project
import 'forgetpassword.dart'; // Adjust import as needed for your project

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true; // For toggling password visibility
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // Logo Telkom Property
              Padding(
                padding: const EdgeInsets.only(top: 70),
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
                      top: 3, // Appears slightly above the second blue container
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.68, // Adjust as needed
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
                      top: 17, // Slightly lower to create the overlap
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.68, // Adjust as needed
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
                                  'Masuk',
                                  style: GoogleFonts.poppins(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  'Isi dengan kredensial yang sudah \ndiberikan sebelumnya',
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
                                    'Username or Email', // Tulisan di luar kotak
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8), // Jarak antara label dan TextField
                                  TextField(
                                    controller: _usernameController,
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
                              // Password TextField
                              // Password TextField with visibility toggle
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // Untuk memastikan label berada di kiri
                                children: [
                                  Text(
                                    'Password', // Tulisan di luar kotak
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8), // Jarak antara label dan TextField
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: _obscureText, // Gunakan variable untuk toggle visibility
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
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off_outlined // Ikon mata tertutup
                                              : Icons.visibility_outlined, // Ikon mata terbuka
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText; // Toggle visibility
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              SizedBox(height: 0),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ForgetPassword()),
                                    );
                                  },
                                  child: Text(
                                    'Lupa Password?',
                                    style: GoogleFonts.poppins(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DashboardPage()),
                                    );
                                  },
                                  child: Text(
                                    'Masuk',
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
                              Spacer(), // Pushes the footer to the bottom
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Text(
                                    'Developed By Telkom University',
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
