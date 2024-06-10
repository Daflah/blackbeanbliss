import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<QuerySnapshot?>(context);
    
    if (brews == null) {
      return CircularProgressIndicator();
    }
    
    brews.docChanges.forEach((change) {
      print(change.doc.data()); // Print data of each changed document
    });
    
    return Container();
  }
}
