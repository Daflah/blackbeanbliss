import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _introData = [
    {
      "image": 'images/introkopi1.png',
      "title": "Black",
      "subtitle": "Nikmati sensasi kopi hitam asli yang kaya akan rasa."
    },
    {
      "image": 'images/introkopi2.png',
      "title": "Bean",
      "subtitle": "Campuran sempurna antara kopi dan susu untuk hari yang lebih baik."
    },
    {
      "image": 'images/introkopi3.png',
      "title": "Bliss",
      "subtitle": "Kreasi kopi unik untuk pecinta kopi sejati di semua kalangan umur."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200], // Ubah warna background menjadi coklat
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            // shop name
            Text(
              "Black Bean Bliss",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            // PageView for carousel
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _introData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3), // Tambahkan border putih
                          borderRadius: BorderRadius.circular(15), // Ubah border radius sesuai keinginan
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12), // Sesuaikan border radius dengan yang diatas
                          child: Image.asset(
                            _introData[index]["image"]!,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _introData[index]["title"]!,
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          _introData[index]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[200],
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _introData.length,
                (index) => buildDot(index, context),
              ),
            ),
            const SizedBox(height: 20),
            // get started button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/authpage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
