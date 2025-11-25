import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Google Sign-In (v7.x) — use the singleton instance and the
  /// authorizationClient to request access tokens when needed.
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static const List<String> _scopes = <String>['email', 'profile'];

  Future<User?> signInWithGoogle() async {
    try {
    // 1️⃣ Start Google Sign In (v7 API)
    // Use `authenticate()` which performs an interactive sign-in and
    // returns a GoogleSignInAccount with authentication tokens.
    final GoogleSignInAccount googleUser =
      await _googleSignIn.authenticate();

    // 2️⃣ Get idToken (authentication getter) — this is synchronous
    // in the v7 API and contains the ID token returned at auth time.
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // 3️⃣ Convert to Firebase credential
      // 3️⃣ The v7 API exposes the access token via the
      // authorizationClient. Request an access token for the scopes you
      // need; Firebase accepts null for accessToken if you only have
      // an ID token.
      final accessToken = (await googleUser.authorizationClient
              .authorizationForScopes(_scopes))
          ?.accessToken;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: accessToken,
      );

      // 4️⃣ Sign in to Firebase
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("GOOGLE SIGN-IN ERROR: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}