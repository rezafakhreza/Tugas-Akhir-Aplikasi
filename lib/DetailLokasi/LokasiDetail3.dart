import 'package:flutter/material.dart';
import 'package:ta/DetailWisata/DetailWisata4.dart';
import 'package:url_launcher/url_launcher.dart';

class LokasiDetail3 extends StatefulWidget {
  const LokasiDetail3({Key? key}) : super(key: key);

  @override
  _LokasiDetail3State createState() => _LokasiDetail3State();
}
class _LokasiDetail3State extends State<LokasiDetail3> {

  void _launchMaps() async {
    const url = 'https://maps.app.goo.gl/i6x1onXjYDVQy7gR7?g_st=ic'; // Ganti dengan URL atau koordinat lokasi yang ingin Anda buka di aplikasi peta
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailWisata4()),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10.0, top: 8.0),
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
            padding: const EdgeInsets.only(top: 30, right: 170.0),
            child: InkWell(
              onTap: () {
                // Handle notification icon tap
              },
              child: const Text(
                'Detail Lokasi Wisata',
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 22.0,left: 22.0, top: 20), // Sesuaikan nilai ini sesuai dengan pergeseran yang Anda inginkan
              child: Text(
                'Museum Geologi',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 38.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 22.0,left: 22.0, top: 2), // Sesuaikan nilai ini sesuai dengan pergeseran yang Anda inginkan
              child: Row(
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
                  Text(
                    'Jl. Banten, Kec.Batununggal',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.only(right: 22.0, left: 22.0, top: 2),
              child: InkWell(
                onTap: () {
                  _launchMaps();
                },
                child: Row(
                  children: [
                    Container(
                      width: 348.0, // Sesuaikan lebar gambar sesuai kebutuhan Anda
                      height: 300.0, // Sesuaikan tinggi gambar sesuai kebutuhan Anda
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.blue, // Warna outline
                          width: 2.0, // Ketebalan outline
                        ),// Membuat ujung gambar menjadi bulat
                        image: DecorationImage(
                          image: AssetImage('Images/map2.png'), // Ganti dengan path gambar Anda
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.0),
            Padding(
              padding: EdgeInsets.only(right: 22.0,left: 22.0), // Sesuaikan nilai ini sesuai dengan pergeseran yang Anda inginkan
              child: Text(
                'Kondisi Rute Menuju Lokasi',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 14.0),
            Padding(
              padding: EdgeInsets.only(right: 22.0,left: 22.0), // Sesuaikan nilai ini sesuai dengan pergeseran yang Anda inginkan
              child: Row(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 36,
                  ),
                  SizedBox(width: 14),
                  Text(
                    'Sebagian jalan berlubang ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 14.0,
                      color: Colors.red,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.only(right: 22.0,left: 22.0), // Sesuaikan nilai ini sesuai dengan pergeseran yang Anda inginkan
              child: Row(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 36,
                  ),
                  SizedBox(width: 14),
                  Text(
                    'Rawan Kemacetan',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 14.0,
                      color: Colors.red,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.only(right: 22.0,left: 22.0), // Sesuaikan nilai ini sesuai dengan pergeseran yang Anda inginkan
              child: Row(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 36,
                  ),
                  SizedBox(width: 14),
                  Text(
                    'Terdapat Jalan Curam',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 14.0,
                      color: Colors.red,
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.only(right: 22.0,left: 22.0), // Sesuaikan nilai ini sesuai dengan pergeseran yang Anda inginkan
              child: Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: Colors.blueAccent,
                    size: 36,
                  ),
                  SizedBox(width: 14),
                  Text(
                    'Kondisi Sebagian Jalan Bagus',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w100,
                      fontSize: 14.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}