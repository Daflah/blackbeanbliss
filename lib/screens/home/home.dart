import 'package:blackbeanbliss/models/brew.dart';
import 'package:blackbeanbliss/models/user.dart';
import 'package:blackbeanbliss/screens/home/brew_list.dart';
import 'package:blackbeanbliss/screens/home/settings_form.dart';
import 'package:blackbeanbliss/services/auth.dart';
import 'package:blackbeanbliss/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Assuming you have a User model that holds the UID of the logged-in user
    final user = Provider.of<User?>(context);

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Bean Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        body: Center(child: Text('Please log in')),
      );
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService(uid: user.uid).brews,
      initialData: [], // Menetapkan initialData ke daftar kosong
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(
            'B.B.B Crew',
            style: TextStyle(color: Colors.white), // Mengubah warna teks menjadi putih
          ),
          backgroundColor: Colors.brown[700],
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white, // Mengubah warna ikon panah back menjadi putih
          ),
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.local_drink, color: Colors.white), // Ikon berwarna putih
              label: Text(
                'Preferences',
                style: TextStyle(color: Colors.white), // Teks berwarna putih
              ),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background/bekopi.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BrewList()
        ),
      ),
    );
  }
}