import 'package:flutter/material.dart';
import 'package:blackbeanbliss/models/food.dart';
import 'package:blackbeanbliss/models/drink.dart';
import 'package:blackbeanbliss/models/signature.dart';

class Shop extends ChangeNotifier {
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

  final List<Drink> _drinkMenu = [
    Drink(
      name: "Avocado Juice",
      price: "18.000",
      imagePath: "images/d_avocado_juice.jpg",
      rating: "4.7",
      description:
          "Creamy and refreshing, Avocado Juice is a blend of ripe avocados, a hint of sweetness, and a splash of chilled goodness. A nourishing and satisfying beverage that's as indulgent as it is healthy, good for bulking, also WWE choices.",
    ),
  ];

  final List<Signature> _signatureMenu = [
    Signature(
      name: "Wagyu Beef Dry Aged x WWE",
      price: "188.000",
      imagePath: "images/s_wagyu_beef.jpg",
      rating: "5.0",
      description:
          "VIP ONLY!!! The Premium dry aged wagyu A5 beef with special secret WWE sauce made exclusively for the VIP served specially.",
    ),
  ];

  // Customer cart
  final List<Food> _cart = [];
  final List<Drink> _cart2 = [];
  final List<Signature> _cart3 = [];

  // Clear carts
  void clearCarts() {
    _cart.clear();
    _cart2.clear();
    _cart3.clear();
    notifyListeners();
  }

  // Getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Drink> get drinkMenu => _drinkMenu;
  List<Signature> get signatureMenu => _signatureMenu;
  List<Food> get cart => _cart;
  List<Drink> get cart2 => _cart2;
  List<Signature> get cart3 => _cart3;

  // Add to cart methods
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void addToCart2(Drink drinkItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart2.add(drinkItem);
    }
    notifyListeners();
  }

  void addToCart3(Signature signatureItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart3.add(signatureItem);
    }
    notifyListeners();
  }

  // Remove from cart methods
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }

  void removeFromCart2(Drink drink) {
    _cart2.remove(drink);
    notifyListeners();
  }

  void removeFromCart3(Signature signature) {
    _cart3.remove(signature);
    notifyListeners();
  }
}

