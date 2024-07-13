import 'package:flutter/material.dart';
import 'package:ta/AR/AR_Museum.dart';
import 'package:page_transition/page_transition.dart';

class arnotready extends StatefulWidget {
  const arnotready({Key? key}) : super(key: key);

  @override
  _arnotreadyState createState() => _arnotreadyState();
}

class _arnotreadyState extends State<arnotready> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 260, // Ubah sesuai dengan lebar yang diinginkan
          height: 390, // Ubah sesuai dengan tinggi yang diinginkan
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0), // Ubah sesuai dengan keinginan untuk melengkungkan pinggiran kotak
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100, // Ubah sesuai dengan tinggi kotak biru yang diinginkan
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.info_rounded,
                      color: Colors.white,
                      size: 42.0, // Ubah sesuai dengan ukuran ikon yang diinginkan
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 110,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      'Mohon Maaf !',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 160,
                left: 30,
                right: 30,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      'Model untuk objek wisata ini masih dalam pengembangan, kami mohon maaf atas ketidak kenyamanannya.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 30,
                right: 30,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      'Mohon Tunggu Pengembangan Aplikasi ini Lebih Lanjut',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 30,
                right: 30,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Ubah warna tombol sesuai keinginan Anda
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0), // Ubah sesuai dengan keinginan untuk melengkungkan pinggiran tombol
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Maintenance',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}