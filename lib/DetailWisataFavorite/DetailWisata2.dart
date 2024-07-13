import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ta/AR/AR_GedungSate.dart';
import 'package:ta/Ulasan Wisata/UlasanWisata.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ta/Home.dart';
import 'package:ta/ARFavorit/WarningAR3.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ta/Favorite/FavoriteWisata.dart';



import 'dart:ui';
import 'dart:async';



class DetailWisata2 extends StatefulWidget {
  const DetailWisata2 ({Key? key}) : super(key: key);

  @override
  _DetailWisata2State createState() => _DetailWisata2State();
}

class Facility {
  final String name;
  final IconData icon;

  Facility({required this.name, required this.icon});
}

class _DetailWisata2State extends State<DetailWisata2> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isFavorited = false; // Menyimpan status favorit

  void _launchMaps() async {
    const url = 'https://maps.app.goo.gl/6a6ANdX7gJ9XiVrJA'; // Ganti dengan URL atau koordinat lokasi yang ingin Anda buka di aplikasi peta
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // List fasilitas statis
  final List<Facility> facilities = [
    Facility(name: 'Area Parkir', icon: Icons.local_parking),
    Facility(name: 'Tempat Makan', icon: Icons.restaurant_rounded),
    Facility(name: 'Masjid', icon: Icons.mosque_rounded),
    Facility(name: 'Wahana Bermain', icon: Icons.attractions_rounded),
    Facility(name: 'Toilet', icon: Icons.wc_rounded),
    Facility(name: 'Tempat Istirahat', icon: Icons.hotel),
    Facility(name: 'ATM', icon: Icons.local_atm_rounded),
    // Tambahkan fasilitas lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 98,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 10, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white, // Atur warna sesuai kebutuhan
                ),
                child: Center(
                  child: Container(
                    width: 40, // Atur sesuai kebutuhan
                    height: 8, // Atur sesuai kebutuhan
                    decoration: BoxDecoration(
                      color: Colors.lightBlue, // Ganti warna sesuai kebutuhan
                      borderRadius: BorderRadius.circular(10), // Atur sesuai kebutuhan
                    ),
                  ),
                ),
              ),
            ),
            expandedHeight: 300.0,
            leading: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.scale,
                    duration: Duration(seconds: 1),
                    alignment: Alignment.bottomCenter,
                    child: FavoritWisata(), // ganti destinationPage dengan halaman tujuan Anda
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(right: 10, left: 20, top: 20, bottom: 20),
                width: 80,
                height: 10,
                child: Icon(
                  Icons.arrow_circle_left_rounded,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
                child: InkWell(
                  onTap: () {
                    // Navigasi ke halaman lain di sini
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WarningAR3()),
                    );
                  },
                  child: Icon(
                    Icons.view_in_ar_rounded,
                    color: Colors.white,
                    size: 35.0,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Image.asset('Images/tsb.png', fit: BoxFit.cover),
                  // Tambahkan gambar-gambar lainnya di sini sesuai kebutuhan Anda
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 5, right: 30, left: 20, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white, // Atur warna sesuai kebutuhan
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Trans Studio Bandung',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                            color: Colors.black,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 51),
                      IconButton(
                        icon: _isFavorited
                            ? Icon(Icons.favorite_rounded, color: Colors.lightBlue, size: 40) // Ubah ikon ketika sudah difavoritkan
                            : Icon(Icons.favorite_outline_rounded, color: Colors.lightBlue, size: 40),
                        onPressed: () {
                          setState(() {
                            _isFavorited = !_isFavorited; // Toggle status favorit
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 2),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                      SizedBox(width: 5),
                      Row(
                        children: [
                          Text(
                            "Jl. Gatot Subroto No.289A",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w100,
                              fontSize: 10.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.circle_rounded,
                            color: Colors.black,
                            size: 6,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Wisata Buka",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                              color: Color(0xFFD4B33A),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Text(
                        'Rp150.000/orang',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 66),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(width: 2),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 2),
                      GestureDetector(
                        onTap: () {
                          // Tambahkan logika navigasi ke halaman review di sini
                          // Contoh:
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPage()));
                        },
                        child: Text(
                          '(50rb Ulasan)',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Tentang Wisata',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 9),
                  Text(
                    'Trans Studio Bandung menawarkan berbagai wahana wisata yang menarik, termasuk pertunjukan seperti Its Magic-Witness The Impossible The Book of The World The New Parade Laser Show Special Effect Action Show. Tempat wisata ini dapat dikunjungi setiap hari, namun jam operasionalnya berbeda-beda tergantung pada hari. Pada hari biasa, Trans Studio Bandung buka dari jam 10 pagi hingga jam 6 sore, sedangkan pada hari Sabtu dan Minggu, jam operasionalnya lebih panjang hingga jam 7 malam. Selain wahana wisata, Trans Studio Bandung juga menawarkan beberapa atraksi dan pertunjukan yang menarik. Untuk membeli tiket masuk, pengunjung dapat membeli langsung melalui official website, membeli dari ticket booth, atau menggunakan Traveloka, yang dianggap lebih menguntungkan.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 14),
                  Text(
                    'Jam Operasional',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 9),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10), // Atur jarak atas dan bawah dari kotak
                    padding: EdgeInsets.all(10),
                    height: 60,// Atur padding di dalam kotak
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2), // Atur warna border
                      borderRadius: BorderRadius.circular(16), // Atur border radius
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senin - Minggu', // Teks di sebelah kiri
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            color: Color(0xFF6E7B45),
                          ),
                        ),
                        Text(
                          '10.00 - 17.00 WIB', // Teks di sebelah kanan
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            color: Color(0xFF1677FF),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 14),
                  Text(
                    'Fasilitas Wisata',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 9),
                  Container(
                    height: 126,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: facilities.length, // Ganti facilities dengan list data fasilitas Anda
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.white,
                            child: Container(
                              width: 112,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.lightBlueAccent, width: 1), // Tambahkan border
                                borderRadius: BorderRadius.circular(15),
                              ),// Sesuaikan lebar card sesuai kebutuhan

                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(22),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(facilities[index].icon, size: 22, color: Color(0xFF1677FF)),
                                      SizedBox(height: 5),
                                      Expanded(
                                        child: Text(
                                          facilities[index].name,
                                          textAlign: TextAlign.center, // Pusatkan teks
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Detail Lokasi Wisata',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchMaps(); // Panggil fungsi untuk membuka aplikasi peta
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'Images/tsbmap.png', // Ganti dengan path relatif dari gambar yang ingin ditambahkan
                              width: double.infinity, // Mengisi lebar sesuai dengan layar
                              height: 140, // Atur tinggi gambar sesuai kebutuhan
                              fit: BoxFit.cover, // Atur tata letak gambar sesuai kebutuhan
                            ),
                          ),
                        ),

                        SizedBox(height: 8),
                        Text(
                          'More About Location',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: 36),
                        Row(
                          children: [
                            Text(
                              'Ulasan Pengunjung',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 108),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => UlasanWisata()));
                              },
                              child: Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 9),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'dari 50 Rating',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.circle,
                              color: Colors.blueGrey,
                              size: 8,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '50 Ulasan',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(
                          color: Colors.blueAccent,
                          thickness: 2,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Andi',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 236),
                            Text(
                              '21 Mei 2024',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          textAlign: TextAlign.justify,
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget dolor dapibus, ultricies massa ut, volutpat felis.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Andi',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 236),
                            Text(
                              '21 Mei 2024',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          textAlign: TextAlign.justify,
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget dolor dapibus, ultricies massa ut, volutpat felis.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Andi',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 236),
                            Text(
                              '21 Mei 2024',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 22,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          textAlign: TextAlign.justify,
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget dolor dapibus, ultricies massa ut, volutpat felis.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}