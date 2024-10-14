import 'package:flutter/material.dart';

class Laporan extends StatefulWidget {
  const Laporan({Key? key}) : super(key: key);

  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  late DateTime _selectedDate;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Set to current date
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelectedDate());
  }

  void _scrollToSelectedDate() {
    final int selectedIndex = _getDaysInMonth().indexOf(_selectedDate);
    if (selectedIndex != -1) {
      _scrollController.animateTo(
        selectedIndex * 60.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  List<DateTime> _getDaysInMonth() {
    final DateTime firstDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final DateTime lastDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0);
    return List.generate(
      lastDayOfMonth.day,
      (index) => firstDayOfMonth.add(Duration(days: index)),
    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }

  String _getDayName(int weekday) {
    const dayNames = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    return dayNames[(weekday - 1) % 7];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4147D5), size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Cek Laporan',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            color: Color(0xFF4147D5),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_selectedDate.year} ${_getMonthName(_selectedDate.month)}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Icon(Icons.calendar_today, color: Color(0xFF4147D5), size: 24),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 80,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: _getDaysInMonth().length,
              itemBuilder: (context, index) {
                final date = _getDaysInMonth()[index];
                final isSelected = date.day == _selectedDate.day;
                final isCurrentMonth = date.month == _selectedDate.month;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  child: Container(
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFE6E7FD) : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isCurrentMonth ? (isSelected ? const Color(0xFF4147D5) : Colors.black) : Colors.grey,
                          ),
                        ),
                        Text(
                          _getDayName(date.weekday),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: isCurrentMonth ? Colors.black : Colors.grey,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4147D5),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
        ],
      ),
    );
  }
}