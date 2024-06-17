import 'package:blackbeanbliss/components/category_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/food_tile.dart';
import '../components/drink_tile.dart';
import '../components/signature_tile.dart';
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
      name: "Green Tea Latte Blend",
      price: "36.000",
      imagePath: "images/signature_coffe/kopimatcha.jpg",
      rating: "4.9",
      description:
          "Savor the harmonious Green Tea Latte Blend. This signature coffee intertwines the earthy notes of matcha green tea with creamy milk, offering a soothing and balanced drink with a touch of sweetness.",
    ),
    Signature(
      name: "Citrus Sunrise Blend",
      price: "52.000",
      imagePath: "images/signature_coffe/kopjeruk2.jpg",
      rating: "4.9",
      description:
          "Wake up to the vibrant Citrus Sunrise Blend. This signature coffee combines the bright flavors of citrus with a smooth coffee base, creating a refreshing and energizing drink that brightens your day.",
    ),
    Signature(
      name: "Orange Zest Espresso",
      price: "44.000",
      imagePath: "images/signature_coffe/kopifreestyle.jpg",
      rating: "4.9",
      description:
          "Experience the invigorating Orange Zest Espresso. This signature blend combines the robustness of espresso with a burst of citrusy orange zest, creating a refreshing and aromatic coffee indulgence.",
    ),
    Signature(
      name: "Affogato Coffee Bliss",
      price: "25.000",
      imagePath: "images/signature_coffe/escreamkopi.jpg",
      rating: "5.0",
      description:
          "Indulge in the luxurious Affogato Coffee Bliss, a harmonious blend of rich espresso poured over creamy vanilla ice cream. This signature drink offers a delightful contrast of hot and cold, combining the boldness of espresso with the smooth sweetness of ice cream. With a stellar rating of 5.0, it promises a satisfying treat that will delight coffee enthusiasts and dessert lovers alike.",
    ),
    Signature(
      name: "Frothy White Bliss",
      price: "46.000",
      imagePath: "images/signature_coffe/kopifoam.jpg",
      rating: "4.9",
      description:
          "Dive into the Frothy White Bliss. This signature coffee captivates with its rich espresso base topped with a fluffy layer of creamy froth, offering a velvety smooth texture and a blissful taste experience.",
    ),
  ];

  final List<Food> _foodMenu = [
    Food(
      name: "Espresso Symphony",
      price: "30.000",
      imagePath: "images/hot_coffe/hotcoffee1.jpg",
      rating: "4.5",
      description:
          "Immerse yourself in the rich and bold notes of Espresso Symphony. This finely crafted espresso offers a symphony of flavors, with deep, roasted undertones complemented by a velvety crema. Each sip delivers a harmonious balance that captivates the senses, making it a favorite among connoisseurs seeking a robust coffee experience.",
    ),
    Food(
      name: "Caramel Cascade",
      price: "22.000",
      imagePath: "images/hot_coffe/hotcoffee2.jpg",
      rating: "4.5",
      description:
          "Treat yourself to the indulgent delight of Caramel Cascade. This exquisite blend combines the smooth richness of caramel with the intense flavors of espresso. The caramel infusion adds a luscious sweetness that harmonizes beautifully with the coffee's deep, aromatic profile. Perfect for those who enjoy a luxurious and comforting coffee break.",
    ),
    Food(
      name: "Java Jive Junction",
      price: "35.000",
      imagePath: "images/hot_coffe/hotcoffee3.jpg",
      rating: "4.5",
      description:
          "Embark on a journey of vibrant flavors with Java Jive Junction. Crafted from the finest Java beans, this coffee boasts a lively and invigorating taste that wakes up the palate. Its robust character is complemented by a smooth finish, making it an ideal choice for those who appreciate a bold and energizing cup of coffee.",
    ),
    Food(
      name: "Crema e Caffe",
      price: "33.000",
      imagePath: "images/hot_coffe/hotcoffee4.jpg",
      rating: "4.5",
      description:
          "Experience the allure of Italy with Crema e Caffe. This espresso-based drink offers a creamy texture and a rich aroma that evoke the charm of Italian cafes. Delightfully smooth, it captivates with every sip, providing a moment of indulgence reminiscent of leisurely afternoons in Milan or Rome.",
    ),
    Food(
      name: "Whispering Winds Blend",
      price: "40.000",
      imagePath: "images/hot_coffe/hotcoffee5.jpg",
      rating: "4.5",
      description:
          "Discover tranquility in a cup with the Whispering Winds Blend. This well-balanced coffee harmonizes gentle flavors and a soothing aroma, creating a serene drinking experience. With its smooth texture and subtle hints of sweetness, it's perfect for moments of relaxation and contemplation.",
    ),
    Food(
      name: "Cherry Blossom Brew",
      price: "20.000",
      imagePath: "images/hot_coffe/hotcoffee6.jpg",
      rating: "4.5",
      description:
          "Embrace the delicate essence of spring with Cherry Blossom Brew. Infused with floral notes, this coffee captures the ephemeral beauty of cherry blossoms in full bloom. Its light and refreshing flavor profile, tinged with a hint of sweetness, offers a rejuvenating experience that brightens any day.",
    ),
    Food(
      name: "Love Isle Espresso",
      price: "25.000",
      imagePath: "images/hot_coffe/hotcoffee7.jpg",
      rating: "4.5",
      description:
          "Fall under the spell of Love Isle Espresso. This enchanting brew delights with its velvety texture and captivating aroma. Each sip reveals layers of deep, nuanced flavors that unfold gracefully on the palate. Whether enjoyed alone or shared with a loved one, it promises a moment of pure indulgence.",
    ),
    Food(
      name: "Golden Sunrise Espresso",
      price: "26.000",
      imagePath: "images/hot_coffe/hotcoffee8.jpg",
      rating: "4.5",
      description:
          "Awaken your senses with the vibrant flavors of Golden Sunrise Espresso. Bursting with brightness and energy, this coffee radiates with a golden hue that mirrors the dawn. Its lively character and invigorating aroma offer a refreshing start to your day or a pick-me-up during afternoon lulls.",
    ),
  ];

  final List<Drink> drinkMenu = [
    Drink(
      name: "Whipped Ice Coffe",
      price: "29.000",
      imagePath: "images/cold_coffe/coldcoffe1.jpeg",
      rating: "4.7",
      description:
          "Indulge in a refreshing and photo-worthy treat with our Whipped Iced Coffee! This delightful beverage features a layer of light and airy whipped coffee mousse made with creamy instant coffee and sugar,  crafted to melt dreamily into your choice of iced cold milk.  The rich coffee flavor is perfectly balanced by the cool milk, creating a refreshing and invigorating drink that's perfect for a hot summer day.",
    ),
    Drink(
      name: "Caramel Macchiato Bliss",
      price: "25.000",
      imagePath: "images/cold_coffe/coldcoffe2.jpeg",
      rating: "4.7",
      description:
          "Our Caramel Macchiato is a classic espresso-based beverage that's sure to please. Made with two shots of espresso, steamed milk, and a drizzle of caramel sauce, it's the perfect combination of sweet, creamy, and caffeinated.",
    ),
    Drink(
      name: "Iced Coffee with Milk: A Refreshing Classic",
      price: "18.000",
      imagePath: "images/cold_coffe/coldcoffe3.jpeg",
      rating: "4.7",
      description:
          "This rich and decadent Iced Coffee with Milk is made with the finest coffee beans and topped with a generous amount of milk. It's the perfect treat for any coffee lover.",
    ),
    Drink(
      name: "Soy Milk Iced Coffee",
      price: "22.000",
      imagePath: "images/cold_coffe/coldcoffe4.jpeg",
      rating: "4.7",
      description:
          "This Iced Coffee with Soy Milk is so good, you'll be craving it all day long. Made with double-strength coffee, cold soy milk, and a touch of sweetness, it's the ultimate coffee indulgence, even for those who avoid dairy.",
    ),
    Drink(
      name: "Sweet and Smooth Caramel Macchiato",
      price: "22.000",
      imagePath: "images/cold_coffe/coldcoffe5.jpeg",
      rating: "4.7",
      description:
          "This rich and decadent Caramel Macchiato is made with the finest espresso beans and topped with a generous drizzle of caramel sauce. It's the perfect treat for any coffee lover.",
    ),
    Drink(
      name: "Cinnamon Spice Iced Latte",
      price: "25.000",
      imagePath: "images/cold_coffe/coldcoffe6.jpeg",
      rating: "4.7",
      description:
          "Embrace the warmth and comfort of our Cinnamon Spice Iced Latte, a delightful beverage that combines the refreshing coolness of iced coffee with the inviting aroma and flavor of cinnamon. Made with our signature iced latte, a touch of cinnamon spice, and a sprinkle of cinnamon on top, it's the perfect way to indulge in a cozy coffee experience.",
    ),
    Drink(
      name: "Americano Coffee",
      price: "24.000",
      imagePath: "images/cold_coffe/coldcoffe7.jpeg",
      rating: "4.7",
      description:
          "Our Americano is crafted with freshly roasted coffee beans for a robust and aromatic espresso base. The hot water dilutes the espresso's intensity, resulting in a smoother and more mellow cup of coffee. Whether you're seeking a caffeine boost without the overwhelming strength of espresso or simply enjoy the delicate nuances of espresso, our Americano is sure to please.",
    ),
    Drink(
      name: "Cold Brew",
      price: "22.000",
      imagePath: "images/cold_coffe/coldcoffe8.jpeg",
      rating: "4.7",
      description:
          "Our Cold Brew Coffee is perfect for those who enjoy a smooth, mellow coffee experience. It's also a great choice for those with sensitive stomachs, as the cold brew process reduces acidity. Whether you're craving a morning pick-me-up or an afternoon refresher, our Cold Brew Coffee is sure to satisfy.",
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
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: const Icon(Icons.share_location_sharp),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(Icons.coffee),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
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
                'images/promotions/promocoffe5.jpg',
                'images/promotions/promocoffe8.jpg',
                'images/promotions/promocoffe7.jpg',
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
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 50),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
