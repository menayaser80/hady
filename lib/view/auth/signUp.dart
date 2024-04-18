// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lava/constants/firebase%20constants.dart';
import 'package:lava/constants/global%20method.dart';
import 'package:lava/view/auth/signIn_page.dart';
import 'package:lava/view/home/home_page.dart';
import 'package:lava/view/widget/custom_botton.dart';
import 'package:lava/view/widget/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _phoneTextController = TextEditingController();

  bool _isLoading = false;
  bool _obscureText = true;
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }
  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading=true;
      });
      try
      {
        await authInstance.createUserWithEmailAndPassword(
            email:_emailTextController.text.toLowerCase().trim() ,
            password:_passTextController.text.trim());
        final User? user=authInstance.currentUser;
        final _uid=user!.uid;
        user.updateDisplayName(_fullNameController.text);
        user.reload();
        await FirebaseFirestore.instance.collection('users').doc(_uid).set({
          'id':_uid,
          'name':_fullNameController.text,
          'email':_emailTextController.text.toLowerCase(),
          'createdAt':Timestamp.now(),
         'shipping_address':_phoneTextController.text,
          'phone':'01030659884',
          'bio':'write your bio...',
          'image':'https://as1.ftcdn.net/v2/jpg/04/28/56/60/1000_F_428566061_Fkqaq0l831DXPM12Ixs9ds3waZWlCXHH.jpg',
        });
        navigateTo(context, HomePage());
        print('succesfully registered');
      }
      on FirebaseException catch(error)
      {
        errorDialog(
          subtitle:'${error.message}' ,
          context:context,
        );
        setState(() {
          _isLoading=false;
        });
      } catch(error)
      {
        errorDialog(
          subtitle:'$error' ,
          context:context,
        );
        setState(() {
          _isLoading=false;
        });
      }finally{
        setState(() {
          _isLoading=false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Field is missing";
                        } else {
                          return null;
                        }
                      },
                      controller: _fullNameController,
                      labelText: 'Full name',
                      inputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return "Please enter a valid Email adress";
                        } else {
                          return null;
                        }
                      },
                      controller: _emailTextController,
                      labelText: 'Email',
                      inputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return "Please enter a valid password";
                        } else {
                          return null;
                        }
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                      controller: _passTextController,
                      labelText: 'Password',
                      inputType: TextInputType.visiblePassword,
                
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Please enter a valid  address";
                        } else {
                          return null;
                        }
                      },
                      controller: _phoneTextController,
                      labelText: 'Shipping address',
                      inputType: TextInputType.visiblePassword,

                    ),
                    SizedBox(
                      height: 100,
                    ),
                    CustomButton(
                      buttomName: 'Sign up',
                      onTap: () {
                        _submitFormOnRegister();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Already a user?',
                          style:
                          const TextStyle(color: Colors.black, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign in',
                                style: const TextStyle(
                                    color: Color(0xFF7441F2), fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    navigateTo(context,SignInPage());
                                  }),
                          ]),
                    ),
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
