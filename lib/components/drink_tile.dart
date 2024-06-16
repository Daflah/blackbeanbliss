import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  final void Function()? onTap; 
  const DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.brown[500],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 12, right: 12),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.asset(
              drink.imagePath,
              height: 140,
            ),

            const SizedBox(height: 10),

            // Text
            Text(
              drink.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                color: Colors.white, // Set the text color to white
              ),
            ),

            const SizedBox(height: 10),

            // Price + Rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  Text(
                    '\Rp' + drink.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  // Rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        drink.rating,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
