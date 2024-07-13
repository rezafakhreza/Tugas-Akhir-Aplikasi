import 'package:flutter/material.dart';

class Wisata {
  final String nama;
  final String lokasi;
  final String gambar;

  Wisata({required this.nama, required this.lokasi, required this.gambar});
}


class WisataProvider extends ChangeNotifier {
  List<Wisata> _favoritedWisata = [];

  List<Wisata> get favoritedWisata => _favoritedWisata;

  void toggleFavorite(Wisata wisata) {
    if (_favoritedWisata.contains(wisata)) {
      _favoritedWisata.remove(wisata);
    } else {
      _favoritedWisata.add(wisata);
    }
    notifyListeners();
  }
}
