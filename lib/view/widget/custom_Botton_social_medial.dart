
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lava/view/home/home_page.dart';
import 'package:lava/view/widget/google%20btn.dart';

import '../../constants/global method.dart';

class CustomBottonSocialMedia extends StatelessWidget {
  const CustomBottonSocialMedia({super.key});
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
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1.3,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            Text('     Or Sign In With     '),
            Container(
              height: 1.3,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GoogleButton(),
      ],
    );
  }
}
