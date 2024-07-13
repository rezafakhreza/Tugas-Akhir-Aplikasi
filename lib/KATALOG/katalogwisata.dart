import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ta/DetailWisataKatalog//DetailWisata.dart';
import 'package:ta/DetailWisataKatalog//DetailWisata2.dart';
import 'package:ta/DetailWisataKatalog//DetailWisata3.dart';
import 'package:ta/DetailWisataKatalog//DetailWisata4.dart';
import 'package:ta/Home.dart';
import 'package:ta/Profile/Profile.dart';
import 'package:ta/Favorite/FavoriteWisata.dart';


import 'dart:async';

class KatalogWisata extends StatefulWidget {
  const KatalogWisata({Key? key}) : super(key: key);

  @override
  _KatalogWisataState createState() => _KatalogWisataState();
}

class Wisata {
  final String name;
  final String location;
  final String image;
  final Widget page;

  Wisata({required this.name, required this.location, required this.image, required this.page});
}

class _KatalogWisataState extends State<KatalogWisata> {
  int _selectedIndex = 1; // Inisialisasi dengan nilai 1 karena halaman KatalogWisata adalah indeks ke-1
  int _NavBarIndex = 1; // Variabel baru untuk menunjukkan navigasi yang sedang aktif

  final TextEditingController _textController =
  TextEditingController(text: 'Eksplor Bandung');

  List<Wisata> filteredKatalog = [];

  List<Wisata> katalog = [
    Wisata(
      name: 'Trans Studio Bandung',
      location: 'Jl. Gatot Subroto No.289A',
      image: 'Images/tsb.png',
      page: DetailWisata2(),
    ),
    Wisata(
      name: 'Kiara Artha Park',
      location: 'Jl. Banten, Kebonwaru.',
      image: 'Images/kiara.png',
      page: DetailWisata3(),
    ),
    Wisata(
      name: 'Museum Geologi',
      location: 'Jl. Diponegoro No.57',
      image: 'Images/museum.png',
      page: DetailWisata4(),
    ),
    Wisata(
      name: 'Gedung Sate',
      location: 'Jl. Diponegoro, No.22',
      image: 'Images/sate.png',
      page: DetailWisata(),
    ),
    // Tambahkan lebih banyak data Wisata sesuai kebutuhan
  ];
  void initState() {
    super.initState();
    filteredKatalog.addAll(katalog);
  }

  void filterKatalog(String query) {
    setState(() {
      filteredKatalog = katalog
          .where((wisata) =>
          wisata.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _navigateToDetailPage(int index) {
    switch(index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailWisata2()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailWisata3()),
        );
        break;

      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailWisata4()),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailWisata()),
        );
        break;

      default:
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _NavBarIndex = index; // Tetapkan nilai _appBarIndex sesuai dengan ikon yang ditekan
      // Navigasi hanya dilakukan jika indeks tidak sama dengan _appBarIndex saat ini
      if (_selectedIndex != index) {
        // Tambahkan penanganan perpindahan halaman berdasarkan indeks ikon yang dipilih
        switch (index) {
          case 0:
          // Navigasi ke halaman home
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            break;
          case 2:
          // Navigasi ke halaman favorit
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FavoritWisata()),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritWisata()),
            );
            break;
          default:
          // Tidak ada tindakan
            break;
        }
      }
    });
  }



  void _navigateToHome() {
    // Navigasi ke halaman home, misalnya menggunakan Navigator.pop
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 186,
        elevation: 0,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          ),
        ),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Images/appbar.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 128, top: 76),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temukan Wisata Menarik',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Di Kota Bandung',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(

                  onChanged: filterKatalog,
                  decoration: InputDecoration(
                    hintText: 'Eksplor Bandung',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _selectedIndex == 0
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: _selectedIndex == 0
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 22.0),
                          child: Text(
                            'Terbaru',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 4,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _selectedIndex == 0
                                ? Colors.blue
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 1),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _selectedIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: _selectedIndex == 1
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 22.0),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 4,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _selectedIndex == 1
                                ? Colors.blue
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 1),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _selectedIndex == 2
                                ? Colors.blue
                                : Colors.transparent,
                            border: Border.all(
                              color: _selectedIndex == 2
                                  ? Colors.blue
                                  : Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 22.0),
                          child: Text(
                            'Trending',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: _selectedIndex == 2
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 4,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _selectedIndex == 2
                                ? Colors.blue
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                padding: EdgeInsets.only(top: 4.0, bottom: 60.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 40.0,
                  childAspectRatio: 1,
                ),
                itemCount: filteredKatalog.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildCatalogCard(filteredKatalog[index]);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _NavBarIndex,
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
    );
  }

  Widget buildCatalogCard(Wisata wisata) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman yang ditentukan oleh parameter page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => wisata.page), // Perbaikan disini
        );
      },
      child: Stack(
        children: [
          Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                wisata.image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(15, 120),
            child: Stack(
              children: [
                Container(
                  width: 140,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              wisata.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Transform.rotate(
                            angle: -3.14 / 4,
                            child: Icon(Icons.arrow_circle_right_rounded,
                                color: Colors.blue, size: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, size: 9, color: Colors.grey),
                          SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              wisata.location,
                              style: TextStyle(
                                fontSize: 9.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
