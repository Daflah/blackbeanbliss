import 'package:blackbeanbliss/components/category_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  MenuCategory selectedCategory = MenuCategory.All;

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
            const SizedBox(height: 20),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
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
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Promo Carousel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Promo for you",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                'images/bekopi.jpg',
                'images/d_taro_milkshake.jpg',
                'images/d_vanilla_milkshake.jpg',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(i),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // Category Buttons
            Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryButton(
                  text: "All",
                  isSelected: selectedCategory == MenuCategory.All,
                  onTap: () {
                    setState(() {
                      selectedCategory = MenuCategory.All;
                    });
                  },
                ),
                CategoryButton(
                  text: "Hot Coffee",
                  isSelected: selectedCategory == MenuCategory.HotCoffee,
                  onTap: () {
                    setState(() {
                      selectedCategory = MenuCategory.HotCoffee;
                    });
                  },
                ),
                CategoryButton(
                  text: "Cold Coffee",
                  isSelected: selectedCategory == MenuCategory.ColdCoffee,
                  onTap: () {
                    setState(() {
                      selectedCategory = MenuCategory.ColdCoffee;
                    });
                  },
                ),
                CategoryButton(
                  text: "Signature Coffee",
                  isSelected: selectedCategory == MenuCategory.SignatureCoffee,
                  onTap: () {
                    setState(() {
                      selectedCategory = MenuCategory.SignatureCoffee;
                    });
                  },
                ),
              ],
            ),
          ),


            const SizedBox(height: 40),

            // Menu Lists
            if (selectedCategory == MenuCategory.All ||
                selectedCategory == MenuCategory.HotCoffee)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hot coffee menu header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      "Hot Coffee",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _foodMenu.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => navigateToFoodDetails(index),
                          child: FoodTile(
                            food: _foodMenu[index],
                            onTap: () => navigateToFoodDetails(index),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            if (selectedCategory == MenuCategory.All ||
                selectedCategory == MenuCategory.ColdCoffee)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cold coffee menu header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      "Cold Coffee",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: drinkMenu.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => navigateToDrinkDetails(index),
                          child: DrinkTile(
                            drink: drinkMenu[index],
                            onTap: () => navigateToDrinkDetails(index),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            if (selectedCategory == MenuCategory.All ||
                selectedCategory == MenuCategory.SignatureCoffee)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Signature coffee menu header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      "Signature Coffee",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: signatureMenu.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => navigateToSignatureDetails(index),
                          child: SignatureTile(
                            signature: signatureMenu[index],
                            onTap: () => navigateToSignatureDetails(index),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
