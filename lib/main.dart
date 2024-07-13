import 'package:flutter/material.dart';
import 'package:ta/Home.dart';
import 'package:ta/SplashScreen.dart';
import 'package:page_transition/page_transition.dart';// Mengganti 'homepage.dart' dengan nama file homepage Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen1(),
    );
  }
}

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  // Function untuk memulai efek loading dan navigasi setelah beberapa detik
  void _startLoading() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      // Navigasi ke halaman utama setelah beberapa detik (misalnya, 3 detik)
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(seconds: 1),
          alignment: Alignment.center,
          child: SplashScreen(), // ganti destinationPage dengan halaman tujuan Anda
        ),
        // Mengganti HomePage() dengan widget homepage Anda
      );
    });
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBAE0FF), // Set background color menjadi BAE0FF
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('Images/Logo.png', height: 100, width: 100),
            SizedBox(height: 40),
            if (_isLoading) // Menampilkan indikator loading jika sedang memuat
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
