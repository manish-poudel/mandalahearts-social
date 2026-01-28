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

  Future<void> signOut() async {
    await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
  }

  Future<void> sendPasswordResetEmail(
    String email,
    String url,
    bool handleCodeInApp,
  ) {
    return _auth.sendPasswordResetEmail(
      email: email.trim(),
      // actionCodeSettings: ActionCodeSettings(
      //   url: url,
      //   handleCodeInApp: handleCodeInApp,
      // ),
    );
  }

  User? get currentUser => _auth.currentUser;
}
