import 'package:flutter/material.dart';
import 'package:ta/DetailWisata/DetailWisata.dart';
import 'package:ta/KATALOG/katalogwisata.dart';
import 'package:ta/Favorite/FavoriteWisata.dart';
import 'package:ta/DetailWisata/DetailWisata2.dart';
import 'package:ta/DetailWisata/DetailWisata3.dart';
import 'package:ta/DetailWisata/DetailWisata4.dart';
import 'package:ta/SplashScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ta/Profile/Profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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

  void _navigateToSearchPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => KatalogWisata()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // allows body to extend behind AppBar
      appBar: AppBar(
        toolbarHeight: 140,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: InkWell(
          child: Container(
            width: 100,
            height: 100,
            child: Image.asset(
              'Images/Logo.png',
              width: 200.0,
              height: 200.0,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: _navigateToSearchPage, // Navigasi ke halaman pencarian
              child: Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 35.0,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Images/bg.png"), // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 30.0, top: 200.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eksplor',
                    style: TextStyle(
                      fontFamily: 'Montagu',
                      fontWeight: FontWeight.w100,
                      fontSize: 32.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Kota Bandung',
                    style: TextStyle(
                      fontFamily: 'Montagu',
                      fontWeight: FontWeight.w100,
                      fontSize: 32.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'The City of Flowers',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    'Bingung Mau Kemana?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Berikut rekomendasi wisata untukmu',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildRecommendationCard(
                          imagePath: 'Images/tsb.png',
                          name: 'Trans Studo Bandung',
                          location: 'Jl. Gatot Subroto No.289A',
                          rating: 4.5,
                          destinationPage : DetailWisata2(),
                        ),
                        buildRecommendationCard(
                          imagePath: 'Images/kiara.png',
                          name: 'Kiara Artha Park',
                          location: 'Jl. Banten, Kebonwaru.',
                          rating: 4.2,
                          destinationPage : DetailWisata3()
                        ),
                        buildRecommendationCard(
                          imagePath: 'Images/museum.png',
                          name: 'Museum Geologi',
                          location: 'Jl. Diponegoro No.57, Cihaur Geulis',
                          rating: 4.8,
                          destinationPage : DetailWisata4(),
                        ),
                        buildRecommendationCard(
                          imagePath: 'Images/gedungsate.png',
                          name: 'Gedung Sate',
                          location: 'Jl. Diponegoro, No.22',
                          rating: 4.8,
                          destinationPage : DetailWisata(),
                        ),
                        // Add more recommendation cards here
                      ],
                    ),
                  ),
                ],
              ),
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
                    icon: Icon(Icons.favorite),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '',
                  ),
                ],
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.normal),
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

  Widget buildRecommendationCard({
    required String imagePath,
    required String name,
    required String location,
    required double rating,
    required Widget destinationPage,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman tujuan yang ditentukan saat kartu diklik
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.scale,
            duration: Duration(seconds: 1),
            alignment: Alignment.bottomCenter,
            child: destinationPage, // ganti destinationPage dengan halaman tujuan Anda
          ),
        );

      },
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 10.0),
        width: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Card(
                  margin: EdgeInsets.only(right: 10),
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      imagePath,
                      width: 186.0,
                      height: 266.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_rounded, size: 18, color: Colors.blue),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.location_on, size: 14, color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          location,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w100,
                            fontSize: 10.0,
                            color: Colors.blueGrey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
