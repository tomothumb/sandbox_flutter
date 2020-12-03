
import 'package:event_app/model/user.dart';

abstract class AuthenticationRepository {

  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<CurrentUser> getCurrentUser();
}