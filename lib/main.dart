import 'package:blackbeanbliss/models/user.dart';
import 'package:blackbeanbliss/services/auth.dart';
import 'package:blackbeanbliss/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,  // Menonaktifkan banner debug
      ),
    );
  }
}
