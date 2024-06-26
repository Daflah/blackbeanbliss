import 'package:blackbeanbliss/models/brew.dart';
import 'package:blackbeanbliss/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context) ?? [];

    return brews.isEmpty
        ? Center(child: CircularProgressIndicator())  // Menampilkan indikator loading jika data belum tersedia
        : ListView.builder(
            itemCount: brews.length,
            itemBuilder: (context, index) {
              return BrewTile(brew: brews[index]);
            },
          );
  }
}
