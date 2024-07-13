import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ta/Home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ta/SplashScreen2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Daftar gambar
  final List<String> imagePaths = [
    'Images/estetik.jpg',
  ];

  // Controller untuk PageView
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar rounded
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.60, // Tinggi gambar 70% dari layar
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(180),
                  ), // Sesuaikan dengan radius yang Anda inginkan
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          // Konten
          Positioned(
            bottom: 32, // Mulai dari bagian bawah gambar
            left: 24,
            right: 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Perjalanan",
                  style: TextStyle(
                    fontFamily: 'Montagu',
                    fontWeight: FontWeight.w300,
                    fontSize: 34.0,
                    color: Color(0xFF1677FF),
                    letterSpacing: 3.0,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Menjelajahi",
                  style: TextStyle(
                    fontFamily: 'Montagu',
                    fontWeight: FontWeight.w300,
                    fontSize: 34.0,
                    color: Color(0xFF1677FF),
                    letterSpacing: 3.0,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Kota Bandung",
                  style: TextStyle(
                    fontFamily: 'Montagu',
                    fontWeight: FontWeight.w300,
                    fontSize: 34.0,
                    color: Color(0xFF1677FF),
                    letterSpacing: 3.0,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Mari Jelajahi Setiap Sudut Kota Bandung Tercinta",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 10.0,
                    color: Color(0xFF1677FF),
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  "Eksplor Lebih Dalam dan Temukan Hal Baru yang Menarik",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 10.0,
                    color: Color(0xFF1677FF),
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 30), // Tambahkan jarak antara teks dan tombol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(seconds: 1),
                              alignment: Alignment.topCenter,
                              child: HomePage(), // ganti destinationPage dengan halaman tujuan Anda
                          ),
                        );
                      },
                      child: Text(
                        'Lewati',
                        style: TextStyle(
                          fontFamily: 'Poppins', // Ganti 'YourFontFamily' dengan nama jenis font yang Anda inginkan
                          fontSize: 14.0, // Sesuaikan ukuran font sesuai kebutuhan Anda
                          fontWeight: FontWeight.w600, // Sesuaikan ketebalan font sesuai kebutuhan Anda
                        ),
                      ),
                      style: ButtonStyle(
                        // Atur ukuran minimum tombol
                        minimumSize: MaterialStateProperty.all(Size(110, 52)), // Ubah ukurannya sesuai kebutuhan Anda
                        // Atur border radius tombol
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0), // Atur radius sesuai kebutuhan Anda
                          ),
                        ),
                        // Atur border tombol
                        side: MaterialStateProperty.all(BorderSide(
                          color: Colors.blueAccent, // Ubah warna sesuai kebutuhan Anda
                          width: 1, // Ubah lebar sesuai kebutuhan Anda
                        )),
                        // Atur warna teks tombol
                        foregroundColor: MaterialStateProperty.all(Colors.blue), // Sesuaikan warna sesuai kebutuhan Anda
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            duration: Duration(seconds: 1),
                            alignment: Alignment.topCenter,
                            child: SplashScreen2(), // ganti destinationPage dengan halaman tujuan Anda
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Selanjutnya',
                            style: TextStyle(
                              fontFamily: 'Poppins', // Ganti 'YourFontFamily' dengan nama jenis font yang Anda inginkan
                              fontSize: 14.0, // Sesuaikan ukuran font sesuai kebutuhan Anda
                              fontWeight: FontWeight.w600, // Sesuaikan ketebalan font sesuai kebutuhan Anda
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_forward_ios_rounded, size: 14), // Tambahkan ikon panah
                        ],
                      ),
                      style: ButtonStyle(
                        // Atur ukuran minimum tombol
                        minimumSize: MaterialStateProperty.all(Size(140, 52)), // Ubah ukurannya sesuai kebutuhan Anda
                        // Atur border radius tombol
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0), // Atur radius sesuai kebutuhan Anda
                          ),
                        ),
                        // Atur border tombol
                        side: MaterialStateProperty.all(BorderSide(
                          color: Colors.blueAccent, // Ubah warna sesuai kebutuhan Anda
                          width: 1, // Ubah lebar sesuai kebutuhan Anda
                        )),
                        // Atur warna teks tombol
                        foregroundColor: MaterialStateProperty.all(Colors.white), // Sesuaikan warna sesuai kebutuhan Anda
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
