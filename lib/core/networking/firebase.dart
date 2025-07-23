import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference returnUserCollectionRef() {
    return firestore.collection("users");
  }
   static CollectionReference returnCoursesCollectionRef() {
    return firestore.collection("courses");
  }

}
