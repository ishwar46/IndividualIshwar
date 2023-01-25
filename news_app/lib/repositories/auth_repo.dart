// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:news_app/models/user_model.dart';

// import '../service/firebase_service.dart';

// class AuthRepo{
//   CollectionReference<UserModel> userRef = FirebaseService.db.collection("users")
//       .withConverter<UserModel>(
//     fromFirestore: (snapshot, _) {
//       return UserModel.fromFirebaseSnapshot(snapshot);
//     },
//     toFirestore: (model, _) => model.toJson(),
//   );
// }