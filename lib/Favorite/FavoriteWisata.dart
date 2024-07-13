import 'package:flutter/material.dart';
import 'package:ta/Home.dart';
import 'package:ta/KATALOG/katalogwisata.dart';
import 'package:ta/DetailWisataFavorite/DetailWisata.dart';
import 'package:ta/DetailWisataFavorite/DetailWisata2.dart';
import 'package:ta/DetailWisataFavorite/DetailWisata3.dart';
import 'package:ta/DetailWisataFavorite/DetailWisata4.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ta/Profile/Profile.dart';

class FavoritWisata extends StatefulWidget {
  const FavoritWisata({Key? key}) : super(key: key);

  @override
  _FavoritWisataState createState() => _FavoritWisataState();
}

class _FavoritWisataState extends State<FavoritWisata> {
  int _selectedIndex = 2;

  void _navigateToHome(BuildContext context) {
    Navigator.pop(context);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Tambahkan penanganan perpindahan halaman berdasarkan indeks ikon yang dipilih
      switch (index) {
        case 0:
        // Navigasi ke halaman home
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          break;
        case 1:
        // Navigasi ke halaman pencarian
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KatalogWisata()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritWisata()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
          break;
        default:
        // Tidak ada tindakan
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 180,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            width: 100,
            height: 100,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 30.0,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 216.0),
            child: InkWell(
              onTap: () {
                // Handle notification icon tap
              },
              child: const Text(
                'Wisata Favorit',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(24.0),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 26.0, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  'Eksplor',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w800,
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Wisata Bandung',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Ayo segera kunjungi tempat wisata kota bandung',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'yang ada di wishlist kamu!',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 250), // Tinggi app bar + margin
                _buildWisataCard(
                  'Gedung Sate',
                  'Jl. Diponegoro, No.22',
                  'Images/sate.png',
                  DetailWisata(),
                ),
                _buildWisataCard(
                  'Trans Studio Bandung',
                  'Jl. Gatot Subroto No.289A',
                  'Images/tsb.png',
                  DetailWisata2(),
                ),
                _buildWisataCard(
                  'Kiara Artha Park',
                  'Jl. Banten, Kebonwaru.',
                  'Images/kiara.png',
                  DetailWisata3(),
                ),
                _buildWisataCard(
                  'Museum Geologi',
                  'Jl. Diponegoro No.57',
                  'Images/museum.png',
                  DetailWisata4(),
                ),
                SizedBox(height: 80), // Padding for BottomNavigationBar
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, -3), // changes position of shadow
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                      // Tambahkan properti selected sesuai dengan kondisi halaman favorit wisata aktif
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                  ),
                ],
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWisataCard(String namaWisata, String lokasi, String imagePath,
      Widget page) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman yang ditentukan oleh parameter page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            margin: const EdgeInsets.symmetric(
                vertical: 20.0, horizontal: 20.0),
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 133,
                height: 131,
              ),
            ),
          ),
          SizedBox(width: 6), // Jarak antara kartu dan teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaWisata,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  lokasi,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10), // Jarak yang lebih kecil untuk ikon panah
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: Colors.black,
          ),
          SizedBox(width: 28),
        ],
      ),
    );
  }
}
