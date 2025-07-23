import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference returnUserCollectionRef() {
    return firestore.collection("users");
  }
  static CollectionReference returnIdentityCollectionRef() {
    return firestore.collection("identity");
  }
  //
  // static CollectionReference returnTripsCollectionRef(String token) {
  //   return firestore
  //       .collection(EndPoints.trips)
  //       .doc(token)
  //       .collection(EndPoints.trips);
  // }
  //
  // static CollectionReference returnShipmentCollectionRef(String token) {
  //   return firestore
  //       .collection(EndPoints.shipment)
  //       .doc(token)
  //       .collection(EndPoints.shipments);
  // }
  //
  // static CollectionReference returnIdentityCollectionRef() {
  //   return firestore.collection(EndPoints.identity);
  // }
  //
  // static Query<Map<String, dynamic>> returnShipmentsCollectionRef() {
  //   return firestore.collectionGroup(EndPoints.shipments);
  // }
  //
  // static Query<Map<String, dynamic>> returTripsCollectionGroupRef() {
  //   return firestore.collectionGroup(EndPoints.trips);
  // }
  //
  // static DocumentReference<Map<String, dynamic>> returnFeeConfig() {
  //   return firestore.collection(EndPoints.admin).doc(EndPoints.configuration);
  // }

  static CollectionReference returnAcceptCollectionRef() {
    return firestore.collection("accept");
  }
  static CollectionReference returnAdminCollectionRef() {
    return firestore.collection("admin");
  }
  //
  // static CollectionReference returnNotificationsCollectionRef(String token) {
  //   return firestore
  //       .collection(EndPoints.notifications)
  //       .doc(token)
  //       .collection(EndPoints.notifications);
  // }
}
