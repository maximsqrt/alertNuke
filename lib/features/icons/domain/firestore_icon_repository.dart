import 'package:alertnukeapp/application/FirebaseUserData.dart';
import 'package:alertnukeapp/features/icons/domain/iconrepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreIconRepository implements Iconrepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sammlung: users -> {user Dokument, freundesListe -> userIds} -> icons
  //                                    -> termine

  @override
  Future<void> saveIconInDB(String name, String iconKey) async {
    await _firestore.collection("users").doc(FirebaseUserData.userId).collection("icons").add({
        "name": name,
        "icon": iconKey
    });
  }
}
