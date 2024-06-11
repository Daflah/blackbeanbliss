import 'package:blackbeanbliss/models/brew.dart';
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

  // Brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Brew(
        name: data['Name'] ?? '',
        strength: data['Shot'] ?? 0,
        sugars: data['Sugars'] ?? '0',
      );
    }).toList();
  }


  // Get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
      .map(_brewListFromSnapshot);
  }
}
