import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'dart:ui';
import 'dart:async';



class DetailWisata1 extends StatefulWidget {
  const DetailWisata1({Key? key}) : super(key: key);

  @override
  _DetailWisataState1 createState() => _DetailWisataState1();
}

class _DetailWisataState1 extends State<DetailWisata1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.only(right: 18),
            width: 100,
            height: 100,
            child: Icon(
              Icons.arrow_circle_left_rounded,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: InkWell(
              onTap: () {
                // Tambahkan logika navigasi untuk aksi tombol AR di sini
              },
              child: Icon(
                Icons.view_in_ar_rounded,
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
                image: AssetImage('Images/wisatabg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                buildCard1("Gedung Sate", "Jl. Diponegoro, No.22",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget dolor dapibus, ultricies massa ut, volutpat felis. Curabitur fermentum nisi nulla, consequat ultricies leo  ermentum nisi nulla, cconsequat ult cursus sed........", 4.5),
                buildCard2("Konten 2"),
                buildCard3("Konten 3"),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _expanded ? 50 : 0,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onHorizontalDragEnd: (_) {
                  setState(() {
                    _expanded = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_drop_down_circle_rounded),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard1(
      String placeName, String location, String content, double rating) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 40,
      top: 300,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: _expanded
              ? const EdgeInsets.only(
              top: 140, right: 0.2, left: 0.2, bottom: 0.3)
              : const EdgeInsets.only(
              top: 480, right: 20, left: 20, bottom: 30),
          decoration: BoxDecoration(
            borderRadius: _expanded
                ? BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))
                : BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_expanded ? 15.0 : 0),
              topRight: Radius.circular(_expanded ? 15.0 : 0),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),

              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF5462AD).withOpacity(0.70),
                  borderRadius: _expanded
                      ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))
                      : BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      placeName,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 28.0,
                        color: Colors.white,
                        letterSpacing: 3.0,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          location,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w100,
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            // Tambahkan logika navigasi ke halaman review di sini
                            // Contoh:
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPage()));
                          },
                          child: Text(
                            'Lihat Review...',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                              color: Colors.white54,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      content,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                      maxLines: _expanded ? null : 3,
                      overflow: _expanded ? null : TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 20),
                    if (!_expanded)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: BorderSide(color: Colors.white, width: 2),
                          ),
                          minimumSize: Size(100, 50),
                        ),
                        child: Text(
                          'Selengkapnya',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget buildCard2(String content) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 40,
      top: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 500, right: 20, left: 20, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF003EB3).withOpacity(0.35), // Warna biru dengan opacity 50%
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Konten',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard3(String content) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 40,
      top: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 500, right: 20, left: 20, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF003EB3).withOpacity(0.35), // Warna biru dengan opacity 50%
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Konten',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}