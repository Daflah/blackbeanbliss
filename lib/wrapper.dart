

import 'package:blackbeanbliss/models/user.dart';
import 'package:blackbeanbliss/pages/menu_pages.dart';
import 'package:blackbeanbliss/screens/authenticate/authenticate.dart';
import 'package:blackbeanbliss/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);
    

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return MenuPage();
    }
  }
}