
abstract class SignInRepository {

  Future<void> signInWithGoogle();
  Future<bool> signInWithAnonymously();
}