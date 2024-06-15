class Food {
  final String name;
  final String price;
  final String imagePath;
  final String rating;
  final String description;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.description,
  });

  // Contoh metode getter untuk harga dalam bentuk double
  double get priceAsDouble => double.parse(price.replaceAll(',', '.'));

  // Contoh metode untuk menampilkan deskripsi singkat
  String get shortDescription =>
      description.length > 50 ? description.substring(0, 50) + '...' : description;
}

