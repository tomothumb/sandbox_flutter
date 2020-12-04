// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../../model/event.dart';
// import './repository.dart';
//
import 'package:event_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'repository.dart';

class FirestoreAuthenticationRepository extends AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirestoreAuthenticationRepository(
      {FirebaseAuth firebaseAuth,
      GoogleSignIn googleSignIn,
      // FirebaseUserStore firebaseUserStore
      })
  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
    _googleSignIn = googleSignIn ?? GoogleSignIn()
  ;

  @override
  Future<CurrentUser> getCurrentUser() async {
    final currentUser = await _firebaseAuth.currentUser;
    return CurrentUser(
      id: currentUser.uid,
      name: currentUser.displayName,
      photoUrl: currentUser.photoURL,
      isAnonymous: currentUser.isAnonymous,
      // createdAt: DateTime.fromMicrosecondsSinceEpoch(currentUser.metadata.creationTime),
      // updatedAt: DateTime.fromMicrosecondsSinceEpoch(currentUser.metadata?.lastSignInTime),
    );
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  Future<void> signOut() {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

}
