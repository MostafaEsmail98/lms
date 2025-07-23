import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lms/core/error/failures.dart';
import 'package:lms/core/networking/firebase.dart';
import '../../domain/entities/user_entity.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSource(this._firebaseAuth);

  Future<Either<Failure,UserEntity>> signUp(String email, String password, String name) async {
    try {
      final result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
            FirebaseHelper.returnUserCollectionRef().doc(value.user!.uid).set({
              'email': value.user!.email,
              'uid': value.user!.uid,
              'name': name,
              'lessons': [],
            });
          });
      return Right(UserEntity(uid: result.user!.uid, email: result.user!.email!, lessons: []));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure,UserEntity>> signIn(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserEntity(uid: result.user!.uid, email: result.user!.email!, lessons: []));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
