import 'package:flutter/material.dart';

class UlasanWisata extends StatefulWidget {
  const UlasanWisata({Key? key}) : super(key: key);

  @override
  _UlasanWisataState createState() => _UlasanWisataState();
}

class _Ulasan {
  String nama;
  String tanggal;
  int rating;
  String ulasan;

  _Ulasan(this.nama, this.tanggal, this.rating, this.ulasan);
}

class _UlasanWisataState extends State<UlasanWisata> {
  bool _isFavorited = false;
  int _rating = 0;
  TextEditingController _ulasanController = TextEditingController();
  List<_Ulasan> _ulasanList = [];

  void _navigateToHome() {
    Navigator.pop(context);
  }

  void _postingUlasan() {
    setState(() {
      _ulasanList.add(_Ulasan(
        'Tester User',
        '21 Mei 2024',
        _rating,
        _ulasanController.text,
      ));
      _rating = 0;
      _ulasanController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: _navigateToHome,
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
            padding: const EdgeInsets.only(top: 30, right: 226.0),
            child: InkWell(
              onTap: () {
                // Handle notification icon tap
              },
              child: const Text(
                'Ulasan Wisata',
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
            const SizedBox(height: kToolbarHeight + 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                              size: 42,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              '4.5',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 1),
                            const Text(
                              '/5.0',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 46),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              '98% pengunjung merasa puas',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 1),
                            const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.black,
                              size: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Text(
                              '50 Rating',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                                color: Colors.blueGrey,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.circle,
                              color: Colors.blueGrey,
                              size: 6,
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              '20 Ulasan',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                                color: Colors.blueGrey,
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
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(
                color: Colors.blueAccent,
                thickness: 2,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                'Beri Rating & Ulasan',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.blue,
                    size: 36,
                  ),
                  const SizedBox(width: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                        child: Icon(
                          index < _rating
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: Colors.lightBlue,
                          size: 24,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: _ulasanController,
                decoration: InputDecoration(
                  hintText: 'Masukkan ulasan Anda',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  alignLabelWithHint: true,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 356,
                  child: ElevatedButton(
                    onPressed: _postingUlasan,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ).copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (_) => Colors.white),
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                              (_) => Colors.blue.withOpacity(0.1)),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (_) => Colors.blue),
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                              (_) => const BorderSide(color: Colors.blue, width: 2.0)),
                    ),
                    child: const Text('Posting'),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Divider(
                color: Colors.blueAccent,
                thickness: 2,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                'Ulasan Pengunjung',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: _ulasanList.isEmpty
                  ? [ // Menampilkan gambar "Belum Ada Ulasan!" jika daftar ulasan kosong
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 10),
                  child: Image.asset(
                    'Images/empty.png', // Ganti dengan path gambar yang sesuai
                    width: 300, // Sesuaikan lebar gambar
                    height: 300, // Sesuaikan tinggi gambar
                  ),
                ),
              ]
                  : _ulasanList.map((ulasan) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            ulasan.nama,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            ulasan.tanggal,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 108.0, left: 1), // Sesuaikan dengan jarak yang diinginkan
                            child: Row(
                              children: List.generate(ulasan.rating, (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: Icon(
                                    Icons.star_rounded,
                                    color: Colors.lightBlue,
                                    size: 22,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      Text(
                        ulasan.ulasan,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Divider(
                        color: Colors.blueAccent,
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ulasanController.dispose();
    super.dispose();
  }
}
