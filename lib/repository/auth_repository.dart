import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _auth;
  // Use the new singleton instance
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  AuthRepository({FirebaseAuth? firebaseAuth})
    : _auth = firebaseAuth ?? FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    await _googleSignIn.initialize();
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final authorizationClient = googleUser.authorizationClient;
    GoogleSignInClientAuthorization? authorization = await authorizationClient
        .authorizationForScopes(['email', 'profile']);
    final accessToken = authorization?.accessToken;

    final credential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: googleAuth.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  Future<UserCredential?> reauthenticateWithGoogle() async {
    const List<String> scopes = <String>[
      'https://www.googleapis.com/auth/contacts.readonly',
    ];
    final user = _auth.currentUser;
    await _googleSignIn.initialize();
    final GoogleSignInAccount? googleUser = await _googleSignIn
        .attemptLightweightAuthentication();
    final GoogleSignInClientAuthorization? authorization = await googleUser
        ?.authorizationClient
        .authorizationForScopes(scopes);
    final accessToken = authorization?.accessToken;
    final credential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: googleUser?.authentication.idToken,
    );
    return await user?.reauthenticateWithCredential(credential);
  }

  Future<void> signOut() async {
    await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email.trim());
  }

  Future<void> sendVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
  }

  User? get currentUser => _auth.currentUser;

  Future<void> refresh() async {
    await currentUser?.reload();
  }

  Future<bool> deleteAccount() async {
    final user = _auth.currentUser;
    if (user == null) return false;
    try {
      await user.delete();
      return true;
    } on FirebaseAuthException {
      return false;
    } catch (e) {
      return false;
    }
  }
}
