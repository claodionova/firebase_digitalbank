import 'package:flutter/material.dart';
import 'navbar.dart'; // Import BottomNavbar

class TampilanUtama extends StatefulWidget {
  final String username; // Tambahkan parameter username

  const TampilanUtama({super.key, required this.username});

  @override
  _TampilanUtamaState createState() => _TampilanUtamaState();
}

class _TampilanUtamaState extends State<TampilanUtama> {
  int selectedIndex = 0; // Menyimpan index yang dipilih pada bottom navigation

  // Fungsi untuk menangani item yang dipilih di bottom navigation
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Fungsi untuk mendapatkan sapaan sesuai waktu
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 18) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: const NetworkImage(
                      'https://i.pravatar.cc/300'), // Contoh gambar
                  radius: 24,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreeting(), // Memanggil fungsi sapaan
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Text(
                      widget.username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Balance',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              '\$48,678.00',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '3455 4562 7710 3507',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '02/30',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Text(
                        widget.username.toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Action Buttons
            Row(
              children: [
                // Button Receive
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[850],
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_downward, color: Colors.white),
                    label: const Text('Receive'),
                  ),
                ),
                const SizedBox(width: 10),
                // Button Transfer
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_upward, color: Colors.white),
                    label: const Text('Transfer'),
                  ),
                ),
                const SizedBox(width: 10),
                // Button Add
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[850],
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _transactionItem('Dribbble', 'Today, 15:30', '-\$142.00',
                      Icons.sports_basketball_outlined),
                  _transactionItem('Trent Bolt', 'Yesterday, 09:45', '+\$74.00',
                      Icons.person_outline),
                  _transactionItem('Apple Services', 'Yesterday, 05:30',
                      '-\$12.00', Icons.apple_outlined),
                  _transactionItem('Byrne LTD', '3 Aug, 09:21', '-\$18.00',
                      Icons.business_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
      // Menambahkan BottomNavbar di bawah
      bottomNavigationBar: BottomNavbar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }

  Widget _transactionItem(
      String title, String date, String amount, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[850],
            radius: 24,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: TextStyle(
              color: amount.startsWith('-') ? Colors.red : Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
