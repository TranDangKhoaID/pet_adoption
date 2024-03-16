import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pet_adoption/screens/login/login.dart';
import 'package:pet_adoption/storage/app_shared.dart';

class AuthService {
  Future<dynamic> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final String? email = gUser?.email;
    final String? name = gUser?.displayName;

    AppPreferences.instance.saveEmail(email.toString());
    AppPreferences.instance.saveFullName(name.toString());
    //AppPreferences.instance.savePhoto(photo.toString());
    final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
    //
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth?.idToken,
    );
    //
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    AppPreferences.instance.logout();
    FirebaseAuth.instance.signOut();
  }
}
