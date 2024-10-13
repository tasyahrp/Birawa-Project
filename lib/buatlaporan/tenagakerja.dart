import 'package:flutter/material.dart';
import 'package:flutter_application_1/buatlaporan/aktivitas.dart';
import 'package:google_fonts/google_fonts.dart';

class TenagaKerjaScreen extends StatefulWidget {
  final String jobTitle;

  TenagaKerjaScreen({required this.jobTitle});

  @override
  _TenagaKerjaScreenState createState() => _TenagaKerjaScreenState();
}

class _TenagaKerjaScreenState extends State<TenagaKerjaScreen> {
  // Ensure that these lists are not empty and contain unique values.
  final List<String> dropdownItems = ['0', '1', '2', '3', '4', '5'];

  // Initialize default values to '0'
  String projectManager = '0';
  String siteManager = '0';
  String siteEngineer = '0';
  String adminProject = '0';
  String drafter = '0';
  String sipil = '0';
  String mekanikal = '0';
  String arsitektur = '0';
  String furnitur = '0';

  String selectedShift = 'None'; // Track selected shift

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 78, 117, 248)),
        onPressed: () {
          Navigator.pop(context); // Kembali ke halaman sebelumnya
        },
      ),
        title: Text(
          'Buat Laporan - Tenaga Kerja',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Title
              Text(
                widget.jobTitle,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              // Job Date
              Text(
                '27/09/2024',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              // Section Links (Tenaga Kerja > Aktivitas > Cuaca > Final Review)
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEDF1FF), // Light blue background for section
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '👤 ',
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Tenaga Kerja >',
                            style: GoogleFonts.poppins(fontSize: 12, color: Color.fromARGB(255, 60, 116, 207)),
                          ),
                          TextSpan(
                            text: ' Aktivitas > Cuaca > Final Review',
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Shift section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jam kerja',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text('Shift 1', style: GoogleFonts.poppins(fontSize: 14)),
                      Radio(
                        value: 'Shift 1',
                        groupValue: selectedShift,
                        onChanged: (value) {
                          setState(() {
                            selectedShift = value.toString(); // Select "Shift 1"
                          });
                        },
                      ),
                      Text('Shift 2', style: GoogleFonts.poppins(fontSize: 14)),
                      Radio(
                        value: 'Shift 2',
                        groupValue: selectedShift,
                        onChanged: (value) {
                          setState(() {
                            selectedShift = value.toString(); // Select "Shift 2"
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Management Section
              Text(
                'Manajemen',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                        'Project Manager', projectManager, (newValue) {
                      setState(() {
                        projectManager = newValue!;
                      });
                    }),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                        'Site Manajer', siteManager, (newValue) {
                      setState(() {
                        siteManager = newValue!;
                      });
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField(
                        'Site Engineer', siteEngineer, (newValue) {
                      setState(() {
                        siteEngineer = newValue!;
                      });
                    }),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                        'Admin Project', adminProject, (newValue) {
                      setState(() {
                        adminProject = newValue!;
                      });
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField('Drafter', drafter, (newValue) {
                      setState(() {
                        drafter = newValue!;
                      });
                    }),
                  ),
                ],
              ),
              Divider(thickness: 1, color: Colors.grey), // Divider between sections
              SizedBox(height: 20),
              // Worker Section
              Text(
                'Pekerja Lapangan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField('Sipil', sipil, (newValue) {
                      setState(() {
                        sipil = newValue!;
                      });
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField('Arsitektur', arsitektur, (newValue) {
                      setState(() {
                        arsitektur = newValue!;
                      });
                    }),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField('Mekanikal', mekanikal, (newValue) {
                      setState(() {
                        mekanikal = newValue!;
                      });
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildDropdownField('Furnitur', furnitur, (newValue) {
                      setState(() {
                        furnitur = newValue!;
                      });
                    }),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Preview Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showPreviewDialog(context); // Show dialog on click
                  },
                  child: Text(
                    'Preview',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4147D5),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dropdown field builder
  Widget _buildDropdownField(String label, String value, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xFF4147D5),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: value, // Ensure this value matches one of the dropdown items.
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color(0xFF4147D5), width: 2), // Blue border with 2px width
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color(0xFF4147D5), width: 2), // Match border on enabled
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Color(0xFF4147D5), width: 2), // Blue border on focus
            ),
          ),
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  // Show the dialog popup for preview
  void _showPreviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.jobTitle,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                // Display the selected shift here
                Text(
                  'Jum\'at, 27 September 2024 - $selectedShift',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                // The table layout
                _buildSummaryTable(),
                SizedBox(height: 20),
                // Approve & Next button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AktivitasScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Approve & Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4147D5),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build the summary table dynamically based on user input
  Widget _buildSummaryTable() {
    // Convert all inputs to integers for summation
    int subtotal1 = int.parse(projectManager) +
        int.parse(siteManager) +
        int.parse(siteEngineer) +
        int.parse(adminProject) +
        int.parse(drafter);

    int subtotal2 = int.parse(sipil) +
        int.parse(arsitektur) +
        int.parse(mekanikal) +
        int.parse(furnitur);

    int total = subtotal1 + subtotal2;

    return Column(
      children: [
        // Header row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTableCell('Manajemen', isHeader: true),
            _buildTableCell('Jumlah', isHeader: true),
          ],
        ),
        Divider(),
        _buildTableRow('1. Project Manager', projectManager),
        _buildTableRow('2. Site Manajer', siteManager),
        _buildTableRow('3. Site Engineer', siteEngineer),
        _buildTableRow('4. Admin Project', adminProject),
        _buildTableRow('5. Drafter', drafter),
        Divider(),
        _buildTableRow('Subtotal 1', subtotal1.toString(), isBold: true),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTableCell('Pekerja Lapangan', isHeader: true),
            _buildTableCell('Jumlah', isHeader: true),
          ],
        ),
        Divider(),
        _buildTableRow('1. Sipil', sipil),
        _buildTableRow('2. Arsitektur', arsitektur),
        _buildTableRow('3. Mekanikal Elektrikal', mekanikal),
        _buildTableRow('4. Furnitur', furnitur),
        Divider(),
        _buildTableRow('Subtotal 2', subtotal2.toString(), isBold: true),
        Divider(),
        _buildTableRow('Total', total.toString(), isBold: true),
      ],
    );
  }

  // Helper function to build table rows
  Widget _buildTableRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTableCell(label, isBold: isBold),
        _buildTableCell(value, isBold: isBold),
      ],
    );
  }

  // Helper function to build individual table cells
  Widget _buildTableCell(String text, {bool isHeader = false, bool isBold = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isHeader ? Color(0xFF4147D5) : Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
