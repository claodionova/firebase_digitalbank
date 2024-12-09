import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'home/tampilan_utama.dart';
import 'package:flutter_firebase/screens/credit_life_screen.dart';
import 'package:flutter_firebase/screens/login_screens.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set initial route
      routes: {
        '/': (context) => CreditLifeScreen(), // Halaman utama sebelum login
        '/login': (context) => LoginScreen(), // Halaman login
      },
      onGenerateRoute: (settings) {
        // Menangani dynamic route untuk tampilan utama dengan username
        if (settings.name == '/home') {
          final String username =
              settings.arguments as String; // Ambil username (email)
          return MaterialPageRoute(
            builder: (context) => TampilanUtama(username: username),
          );
        }
        return null; // Kembalikan null jika route tidak ditemukan
      },
    );
  }
}
