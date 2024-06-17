import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum MenuCategory {
  All,
  HotCoffee,
  ColdCoffee,
  SignatureCoffee,
}

class CategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFFEBCD) : Colors.brown[400],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}