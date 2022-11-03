// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../storage.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User get currentUser => _firebaseAuth.currentUser!;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    }
  }

  Future<void> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ["email", "public_profile"]);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    await _firebaseAuth.signInWithCredential(facebookAuthCredential);
  }

  Future<void> signInWithGithub(context) async {
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: githubClientId,
      clientSecret: githubClientSecret,
      redirectUrl: githubClientRedirectUri,
    );

    await gitHubSignIn.signIn(context).then((value) async {
      final twitterAuthCredential = GithubAuthProvider.credential(value.token);

      await _firebaseAuth.signInWithCredential(twitterAuthCredential);
    });
  }

  // Future<void> signInWithTwitter() async {
  //   final TwitterLogin twitterLogin = TwitterLogin(
  //     apiKey: twitterApiKey,
  //     apiSecretKey: twitterAPiKeySecret,
  //     redirectURI: 'foodies://',
  //   );

  //   try {
  //     await twitterLogin.login().then((value) async {
  //       final OAuthCredential twitterAuthCredential =
  //           TwitterAuthProvider.credential(
  //         accessToken: value.authTokenSecret!,
  //         secret: value.authTokenSecret!,
  //       );

  //       await _firebaseAuth.signInWithCredential(twitterAuthCredential);
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint(e.message);
  //   }
  // }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
