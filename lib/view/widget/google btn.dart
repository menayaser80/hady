import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lava/constants/global%20method.dart';
import 'package:lava/view/home/home_page.dart';
import 'package:lava/view/widget/text_widget.dart';




class GoogleButton extends StatelessWidget {
  GoogleButton({Key? key}) : super(key: key);
  bool _isloading = false;

  Future<User?> _googleSignUp({required BuildContext context}) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

      final String? name = user?.displayName ;
      final String? image = user?.photoURL ;
      final String? email = user?.email ;
      final String? uid = user?.uid ;
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        'id': uid,
        'name':name,
        'image': image,
        'email': email,
        'createdAt': Timestamp.now(),
        'phone':'01030659884',
        'bio':'write your bio...',
      });
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          width: 1,
          color: Colors.grey
        )
      ),
      child: InkWell(
        onTap: () async{
        await  _googleSignUp(context: context).then((value) {
          navigateTo(context,HomePage());
        });
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              color: Colors.white,
              child: Image.asset(
                'assets/images/logo google.jpeg',
                width: 40.0,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
            Textwidget(
              text: 'Sign in with google', color: Colors.black, textsize: 18)
        ]),
      ),
    );
  }
}