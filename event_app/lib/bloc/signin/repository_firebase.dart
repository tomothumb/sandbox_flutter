
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'repository.dart';

class FirebaseSignInRepository extends SignInRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseSignInRepository(
      {FirebaseAuth firebaseAuth,
      GoogleSignIn googleSignIn,
      // FirebaseUserStore firebaseUserStore
      })
  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
    _googleSignIn = googleSignIn ?? GoogleSignIn()
  ;

  @override
  Future<void> signInWithGoogle() async {
    print('signInWithGoogle');
    print(_firebaseAuth);

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    print(googleAuth);
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    print(credential);
    await _firebaseAuth.signInWithCredential(credential);
    // throw UnimplementedError();
  }

  @override
  Future<bool> signInWithAnonymously() async {
    print('signInWithAnonymously');
    print(_firebaseAuth);
    await _firebaseAuth.signInAnonymously();

    // throw UnimplementedError();
  }


  // @override
  // Future<CurrentUser> getCurrentUser() async {
  //   final currentUser = await _firebaseAuth.currentUser;
  //   return CurrentUser(
  //     id: currentUser.uid,
  //     name: currentUser.displayName,
  //     photoUrl: currentUser.photoURL,
  //     isAnonymous: currentUser.isAnonymous,
  //     // createdAt: DateTime.fromMicrosecondsSinceEpoch(currentUser.metadata.creationTime),
  //     // updatedAt: DateTime.fromMicrosecondsSinceEpoch(currentUser.metadata?.lastSignInTime),
  //   );
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<bool> isSignedIn() async {
  //   final currentUser = await _firebaseAuth.currentUser;
  //   return currentUser != null;
  // }
  //
  // @override
  // Future<void> signOut() {
  //   return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  // }

}
