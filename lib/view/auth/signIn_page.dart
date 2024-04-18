// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lava/constants/firebase%20constants.dart';
import 'package:lava/constants/global%20method.dart';
import 'package:lava/view/auth/forget%20password.dart';
import 'package:lava/view/auth/signUp.dart';
import 'package:lava/view/home/home_page.dart';
import 'package:lava/view/widget/Auth%20btn.dart';
import 'package:lava/view/widget/custom_text.dart';
import 'package:lava/view/widget/custom_botton.dart';
import 'package:lava/view/widget/custom_Botton_social_medial.dart';
import 'package:lava/view/widget/custom_textfield.dart';

import '../../constatnt.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailTextController = TextEditingController();
  final passTextController = TextEditingController();
  final passFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var obscureText = true;
  @override
  void dispose() {
    emailTextController.dispose();
    passTextController.dispose();
    passFocusNode.dispose();
    super.dispose();
  }
  bool isVisable = true;
  bool _isLoading = false;
  void submitFormOnLogin() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      formKey.currentState!.save();
      setState(() {
        _isLoading=true;
      });
      try
      {
        await authInstance.signInWithEmailAndPassword(
            email:emailTextController.text.toLowerCase().trim() ,
            password:passTextController.text.trim());
        navigateTo(context, HomePage());
        print('succesfully logged in');
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
              CustomText(
                text: 'Sign In',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'E-Mail',
                      controller: emailTextController,
                      inputType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return 'Please enter a valid email address';
                        }else
                        {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        controller: passTextController,
                        obscureText: obscureText,
                        validator: (value){
                          if(value!.isEmpty || value.length<7){
                            return 'Please enter a valid Password';
                          }else
                          {
                            return null;
                          }
                        },
                        labelText: 'Password',
                        inputType: TextInputType.text,

                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            obscureText=!obscureText;
                          });
                        },
                        child: Icon(
                          obscureText?
                          Icons.visibility:Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    navigateTo(context,ForgetPasswordScreen());
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(
                          0xff004269,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          0xff004269,
                        )),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Don\'t have an account ?',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                      onPressed: () {
                     navigateTo(context, SignUpPage());
                      },
                      child: CustomText(
                        text: 'Sign up',
                      )),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              CustomButton(
                buttomName: 'Sign In',
                onTap: () {
                  submitFormOnLogin();
                },
              ),
              SizedBox(
                height: 6,
              ),
              AuthButton(fct: (){
                navigateTo(context, HomePage());
              }, buttonText: 'Continue as a Guest',
                primary: kPrimaryColor,),
              CustomBottonSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
