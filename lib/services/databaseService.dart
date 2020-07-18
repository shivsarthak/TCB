import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:thecollegebee/screens/objects/user.dart';

class DatabaseService {
  Stream<DocumentSnapshot> userDataStream({String uid}) {
    return Firestore.instance.collection('Users').document(uid).snapshots();
  }

  Future<QuerySnapshot> getCollegeData() async {
    return Firestore.instance.collection("Colleges").getDocuments();
  }

  Future createUserDocument({User user}) async {
    await Firestore.instance.collection('Users').document(user.uid).setData({
      'uid': user.uid,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'college': user.college,
      'rollNo': user.rollNo,
    });
  }
}
