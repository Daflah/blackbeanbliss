

import 'package:blackbeanbliss/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    // return either Home or Authenticate widget
    return Home();
  }
}