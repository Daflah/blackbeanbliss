// Import packages yang diperlukan
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/drink.dart'; // Ganti dengan path yang sesuai

// Widget untuk halaman detail minuman
class DrinkDetailsPage extends StatefulWidget {
  final Drink drink;

  const DrinkDetailsPage({Key? key, required this.drink}) : super(key: key);

  @override
  State<DrinkDetailsPage> createState() => _DrinkDetailsPageState();
}

// State untuk halaman detail minuman
class _DrinkDetailsPageState extends State<DrinkDetailsPage> {
  // Visibility status barcode
  bool isBarcodeVisible = false;

  // Fungsi untuk toggle visibility barcode
  void toggleBarcodeVisibility() {
    setState(() {
      isBarcodeVisible = !isBarcodeVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.brown[700],
      body: Column(
        children: [
          // ListView untuk detail minuman
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // Container untuk detail minuman
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFEBCD),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Gambar minuman
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              widget.drink.imagePath,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[800],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.drink.rating,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Nama minuman
                        Center(
                          child: Text(
                            widget.drink.name,
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 28,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Harga
                        Center(
                          child: Text(
                            "\Rp${widget.drink.price}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Deskripsi
                  Text(
                    "About Products",
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.drink.description,
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.white,
                      fontSize: 16,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Container untuk tombol tambah ke keranjang dengan slider
          GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < 0 && !isBarcodeVisible) {
                toggleBarcodeVisibility();
              } else if (details.delta.dy > 0 && isBarcodeVisible) {
                toggleBarcodeVisibility();
              }
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFFEBCD),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown,
                    spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Garis horizontal
                  Container(
                    height: 5,
                    width: double.infinity,
                    color: Colors.brown[800],
                  ),

                  // AnimatedContainer untuk gambar barcode
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: isBarcodeVisible ? 200 : 0,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    color: Color(0xFFFFEBCD),
                    child: isBarcodeVisible
                        ? Image.asset(
                            'images/barcode/barcoderemovebg.png', // Sesuaikan dengan path gambar barcode
                            width: double.infinity,
                            fit: BoxFit.contain, // Menyesuaikan gambar agar tidak terpotong
                          )
                        : null,
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
