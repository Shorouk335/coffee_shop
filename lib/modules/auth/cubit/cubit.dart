import 'package:coffee_shop/modules/auth/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  static AuthCubit get(context) => AuthCubit();

  UserCredential? userCredential;

  createAccount(
      {required String emailAddress, required String password}) async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        print("create account succccccccccccces");

        emit(LoginAuthState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  login({required String emailAddress, required String password}) async {
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) {
        print("logggggggggggggin ");
        emit(RegisterAuthState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(SignOutAuthState());
  }



  Future<UserCredential> signInWithGoogle() async {
    print("siiiiiiiiiiiign in with gooogle 1111 ");
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print("siiiiiiiiiiiign in with gooogle 22222 ");

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    print("siiiiiiiiiiiign in with gooogle 33333333 ");

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print("siiiiiiiiiiiign in with gooogle 444444 ");

    // Once signed in, return the UserCredential
    emit(GoogleLogIn());
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
