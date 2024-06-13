import 'package:blackbeanbliss/models/user.dart';
import 'package:blackbeanbliss/pages/intro_page.dart';
import 'package:blackbeanbliss/screens/authenticate/authenticate.dart';
import 'package:blackbeanbliss/screens/home/home.dart';
import 'package:blackbeanbliss/services/auth.dart';
import 'package:blackbeanbliss/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Ini buat firebase jangan diapus
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _seenIntro = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _seenIntro = prefs.getBool('seenIntro') ?? false;
        _isLoading = false;
      });
    } catch (error) {
      print('Error initializing SharedPreferences: $error');
      setState(() {
        _seenIntro = false;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        initialRoute: _seenIntro ? '/' : '/intro',
        routes: {
          '/': (context) => Wrapper(),
          '/intro': (context) => IntroPage(),
          '/authpage': (context) => Authenticate(),
          '/home': (context) => Home(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
