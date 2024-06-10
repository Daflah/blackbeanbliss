import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({required this.uid}); // Required keyword to ensure uid is non-null

  // Collection Reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'Sugars': sugars,
      'Name': name,
      'Shot': strength,
    });
  }

  // Get brews stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
