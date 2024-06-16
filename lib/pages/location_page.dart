import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<bool> _showDescriptions = List.generate(5, (_) => false);

  void _toggleDescription(int index) {
    setState(() {
      _showDescriptions[index] = !_showDescriptions[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> locations = [
      {
        'image': 'images/location/coffelocation1.jpg',
        'name': 'Black Bean Bliss Jakarta',
        'description': 'A cozy coffee spot offering a variety of specialty blends and delicious pastries. Perfect for a relaxing coffee break.',
        'address': 'Jl. Melawai Raya 67-68 Melawai, RT.7/RW.5, Kramat Pela, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12130',
        'rating': '4.5'
      },
      {
        'image': 'images/location/coffelocation2.jpg',
        'name': 'Black Bean Bliss Bandung',
        'description': 'Enjoy a serene ambiance with our signature coffees and delightful snacks. A great place to unwind.',
        'address': 'Jl. Supratman, Cihapit, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40114',
        'rating': '4.0'
      },
      {
        'image': 'images/location/coffelocation3.jpg',
        'name': 'Black Bean Bliss Surabaya',
        'description': 'Discover our unique coffee blends in a stylish setting. Perfect for meeting friends or enjoying some alone time.',
        'address': 'Jl. Kebon Rojo, Krembangan Sel., Kec. Krembangan, Surabaya, Jawa Timur 60175',
        'rating': '4.2'
      },
      {
        'image': 'images/location/coffelocation4.jpg',
        'name': 'Black Bean Bliss Yogyakarta',
        'description': 'Experience our cozy atmosphere and aromatic coffees that will delight your senses.',
        'address': 'Jl. KH. Ahmad Dahlan 126-108, Notoprajan, Ngampilan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55262',
        'rating': '3.8'
      },
      {
        'image': 'images/location/coffelocation5.jpg',
        'name': 'Black Bean Bliss Semarang',
        'description': 'Indulge in our specialty coffees and treats while enjoying the vibrant energy of the city.',
        'address': 'Jl. Ahmad Yani No.152, Karangkidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50136',
        'rating': '4.7'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Locations',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown[700],
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back arrow to white
        ),
      ),
      body: Container(
        color: Colors.brown[700],
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEBCD),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => _toggleDescription(index),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          locations[index]['image']!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (_showDescriptions[index])
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locations[index]['name']!,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown[900],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              locations[index]['description']!,
                              style: TextStyle(fontSize: 16, color: Colors.brown[900]),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Alamat: ${locations[index]['address']}',
                              style: TextStyle(fontSize: 16, color: Colors.brown[900]),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star_half, color: Colors.yellow),
                                SizedBox(width: 8),
                                Text('${locations[index]['rating']}/5', style: TextStyle(fontSize: 16, color: Colors.brown[900])),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: LocationPage(),
));
