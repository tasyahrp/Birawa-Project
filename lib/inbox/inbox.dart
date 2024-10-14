import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  // Controller untuk search bar
  TextEditingController _searchController = TextEditingController();

  // Daftar pesan asli
  List<Map<String, String>> _messages = [
    {'sender': 'PT. Bangun Negeri Selalu', 'message': 'Tidak bisa Upload Foto pada buat lap...', 'date': '27/09/2024'},
    {'sender': 'PT. Tembok Kokoh Terpercaya', 'message': 'Kesalahan pada jaringan server...', 'date': '25/09/2024'},
    {'sender': 'PT. Karya Jaya Abadi', 'message': 'Laporan sudah di-review oleh admin...', 'date': '24/09/2024'},
    {'sender': 'PT. Sumber Daya Unggul', 'message': 'Mohon periksa kembali file yang dilampirkan...', 'date': '23/09/2024'},
  ];

  // Daftar pesan yang difilter
  List<Map<String, String>> _filteredMessages = [];

  @override
  void initState() {
    super.initState();
    // Inisialisasi filteredMessages dengan semua pesan
    _filteredMessages = _messages;

    // Menambahkan listener pada searchController untuk melakukan filter otomatis
    _searchController.addListener(() {
      _filterMessages();
    });
  }

  // Fungsi untuk memfilter pesan berdasarkan input search
  void _filterMessages() {
    String searchText = _searchController.text.toLowerCase();

    setState(() {
      _filteredMessages = _messages.where((message) {
        return message['sender']!.toLowerCase().contains(searchText) ||
               message['message']!.toLowerCase().contains(searchText);
      }).toList();
    });
  }

  // Fungsi untuk menambahkan pesan baru
  void _addNewMessage(String subject, String message, String sender) {
    setState(() {
      _messages.insert(0, {
        'sender': sender,
        'message': message,
        'date': DateTime.now().toString().split(' ')[0], // Format tanggal
      });
      _filteredMessages.insert(0, {
        'sender': sender,
        'message': message,
        'date': DateTime.now().toString().split(' ')[0],
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF4147D5)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Inbox',
          style: TextStyle(color: Color(0xFF4147D5)),
        ),
        titleSpacing: 0, 
        actions: [
          IconButton(
            icon: Icon(Icons.message, color: Color(0xFF4147D5)),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return NewChatBottomSheet(onSendMessage: _addNewMessage);
                },
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari pesan masuk',
                prefixIcon: Icon(Icons.search, color: Color(0xFF4147D5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF4147D5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF4147D5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF4147D5)),
                ),
              ),
            ),
          ),
          // List Pesan
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[400],
                    child: Text(
                      _filteredMessages[index]['sender']!.substring(0, 3), 
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    _filteredMessages[index]['sender']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    _filteredMessages[index]['message']!,
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    _filteredMessages[index]['date']!,
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    // Aksi ketika pesan dipilih
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageDetailScreen(
                          message: _filteredMessages[index], 
                          onReply: _addNewMessage,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewChatBottomSheet extends StatefulWidget {
  final Function(String, String, String) onSendMessage;

  NewChatBottomSheet({required this.onSendMessage});

  @override
  _NewChatBottomSheetState createState() => _NewChatBottomSheetState();
}

class _NewChatBottomSheetState extends State<NewChatBottomSheet> {
  String? selectedMitra;
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  List<String> mitraList = [
    'PT. Bangun Negeri Selalu',
    'PT. Tembok Kokoh Terpercaya',
    'PT. Karya Jaya Abadi',
    'PT. Sumber Daya Unggul',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFF4147D5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pesan Baru',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('Kepada'),
                    value: selectedMitra,
                    items: mitraList.map((mitra) {
                      return DropdownMenuItem(
                        value: mitra,
                        child: Text(mitra),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMitra = value;
                      });
                    },
                  ),
                  // Divider(thickness: 1.5),

                  TextField(
                    controller: _subjectController,
                    decoration: InputDecoration(
                      hintText: 'Subjek',
                      border: InputBorder.none,
                    ),
                  ),
                  Divider(thickness: 0.5),

                  TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Pesan',
                      border: InputBorder.none,
                    ),
                    maxLines: 4,
                  ),

                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_subjectController.text.isNotEmpty &&
                          _messageController.text.isNotEmpty &&
                          selectedMitra != null) {
                        widget.onSendMessage(
                          _subjectController.text,
                          _messageController.text,
                          selectedMitra!,
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4147D5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Kirim', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageDetailScreen extends StatefulWidget {
  final Map<String, String> message;
  final Function(String, String, String) onReply;

  MessageDetailScreen({required this.message, required this.onReply});

  @override
  _MessageDetailScreenState createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesan'),
        backgroundColor: Color(0xFF4147D5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dari: ${widget.message['sender']}'),
            SizedBox(height: 8),
            Text('Pesan: ${widget.message['message']}'),
            Spacer(),
            TextField(
              controller: _replyController,
              decoration: InputDecoration(
                hintText: 'Balas Pesan',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                widget.onReply(
                  'Re: ${widget.message['message']}',
                  _replyController.text,
                  widget.message['sender']!,
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4147D5)),
              child: Text('Kirim Balasan', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InboxScreen(),
  ));
}
