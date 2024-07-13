import 'package:flutter/material.dart';
import 'package:ta/Home.dart';
import 'package:ta/KATALOG/katalogwisata.dart';
import 'package:ta/Favorite/FavoriteWisata.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 3;

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
      appBar: AppBar(
        backgroundColor: Color(0xFFBAE0FF), // Warna latar belakang AppBar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Mengatur sudut-sudutnya menjadi melengkung
          ),
        ),
        centerTitle: true, // Untuk membuat judul berada di tengah
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
            color: Colors.black, // Warna teks menjadi hitam
          ),
        ),
        leading: Container(), // Menghapus tombol back
        toolbarHeight: 80, // Mengatur tinggi AppBar menjadi 80
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 28,
              left: MediaQuery.of(context).size.width / 2 - 180, // Menempatkan ikon profil di tengah horizontal
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 140,
                    color: Colors.blue, // Warna ikon profil
                  ),
                  SizedBox(height: 2), // Spasi antara ikon profil dan teks
                  Text(
                    'Tester User',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 26),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Menetapkan sudut menjadi bulat
                      ),
                      minimumSize: Size(360, 60), // Mengatur ukuran minimum tombol
                      side: BorderSide(
                        color: Colors.blueAccent, // Mengubah warna outline
                        width: 3, // Mengatur ketebalan garis
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align ke kiri
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 160),
                          child: Row(
                            children: [
                              Icon(Icons.favorite_outline_rounded, size: 22, color: Color(0xFF0F3872)),
                              SizedBox(width: 10),
                              Text('Wishlist Wisata',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Color(0xFF0F3872),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, size: 22, color: Colors.black),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Menetapkan sudut menjadi bulat
                      ),
                      minimumSize: Size(360, 60), // Mengatur ukuran minimum tombol
                      side: BorderSide(
                        color: Colors.blueAccent, // Mengubah warna outline
                        width: 3, // Mengatur ketebalan garis
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align ke kiri
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 168),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline_rounded, size: 22, color: Color(0xFF0F3872)),
                              SizedBox(width: 10),
                              Text('Tentang Kami',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Color(0xFF0F3872),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, size: 22, color: Colors.black),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Menetapkan sudut menjadi bulat
                      ),
                      minimumSize: Size(360, 60),
                      backgroundColor: Colors.red,// Mengatur ukuran minimum tombol
                      side: BorderSide(
                        color: Colors.red, // Mengubah warna outline
                        width: 3, // Mengatur ketebalan garis
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align ke kiri
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 164),
                          child: Row(
                            children: [
                              Icon(Icons.exit_to_app_rounded, size: 22,),
                              SizedBox(width: 10),
                              Text('Keluar Aplikasi',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, size: 22,),
                      ],
                    ),
                  ),
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
      ),
    );
  }
}
