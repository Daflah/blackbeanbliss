import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/food_tile.dart';
import '../components/drink_tile.dart';
import '../components/signature_tile.dart';
import '../components/button.dart';
import '../models/drink.dart';
import '../models/food.dart';
import '../models/signature.dart';
import '../pages/food_details_page.dart';
import '../pages/drink_details_page.dart';
import '../pages/signature_details_page.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Signature> signatureMenu = [
    Signature(
      name: "Wagyu Beef Dry Aged x WWE",
      price: "188.000",
      imagePath: "images/s_wagyu_beef.jpg",
      rating: "5.0",
      description:
          "VIP ONLY!!! The Premium dry aged wagyu A5 beef with special secret WWE sauce made exclusively for the VIP served specially.",
    ),
    Signature(
      name: "Cena Rib Eye with Tartar Sauce",
      price: "178.000",
      imagePath: "images/s_cena_ribeye.jpg",
      rating: "4.9",
      description:
          "John Cena eat this?!! Tasty tender US rib eye premium beef grilled perfectly well comes with special tartar sauce feels like john cena.",
    ),
  ];

  final List<Food> _foodMenu = [
    Food(
      name: "Banger and Mash",
      price: "45.000",
      imagePath: "images/m_banger_and_mash.jpg",
      rating: "4.5",
      description:
          "Traditional British comfort food! Savor the flavors of savory sausages atop a bed of creamy mashed potatoes, all drizzled with rich onion gravy. A hearty and satisfying dish.",
    ),
  ];

  final List<Drink> drinkMenu = [
    Drink(
      name: "Avocado juice",
      price: "18.000",
      imagePath: "images/d_avocado_juice.jpg",
      rating: "4.7",
      description:
          "Creamy and refreshing, Avocado Juice is a blend of ripe avocados, a hint of sweetness, and a splash of chilled goodness. A nourishing and satisfying beverage that's as indulgent as it is healthy, good for bulking, also WWE choices.",
    ),
  ];

  void navigateToFoodDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: _foodMenu[index],
        ),
      ),
    );
  }

  void navigateToDrinkDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DrinkDetailsPage(
          drink: drinkMenu[index],
        ),
      ),
    );
  }

  void navigateToSignatureDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignatureDetailsPage(
          signature: signatureMenu[index],
        ),
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'B.B.B',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Promo banner
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 17, 0),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Image.asset(
                    'images/coffeegif.gif', // Path to your GIF file
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Get 40% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  MyButton(
                    text: "Redeem",
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.red,
                          content: const Text(
                            "You have redeemed the promo!",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.done),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Special offer image and text
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Image.asset(
                    'images/coffeegif.gif', // Path to your GIF file
                    height: 90,
                    width: 90,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Best Under-Deals!',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),

            // location bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
                padding: const EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    const FaIcon(
                      FontAwesomeIcons.mapLocationDot,
                      color: Color(0xFFf60909),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Visit Our Location',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 6),
                    MyButton(
                      text: "Visit",
                      onTap: () {
                        Navigator.pushNamed(context, '/location');
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),

            // Food menu header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Food Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Food menu list
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _foodMenu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => navigateToFoodDetails(index),
                    child: FoodTile(food: _foodMenu[index], onTap: () => navigateToFoodDetails(index)),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Drink menu header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Drink Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Drink menu list
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: drinkMenu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => navigateToDrinkDetails(index),
                    child: DrinkTile(drink: drinkMenu[index], onTap: () => navigateToDrinkDetails(index)),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Signature menu header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Signature Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Signature menu list
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: signatureMenu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => navigateToSignatureDetails(index),
                    child: SignatureTile(signature: signatureMenu[index], onTap: () => navigateToSignatureDetails(index)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
