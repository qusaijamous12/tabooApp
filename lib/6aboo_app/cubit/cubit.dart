import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlesignin/6aboo_app/cubit/state.dart';
import 'package:googlesignin/6aboo_app/sign_in.dart';
import 'package:googlesignin/helper/cashe_helper.dart';

import '../../constatnt/observer.dart';
import '../home_screen_taboo.dart';

class AppCubit extends Cubit<AppState>{

  AppCubit():super(InitialAppState());

  static AppCubit get(context)=>BlocProvider.of(context);

  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  User  ?user;


  Future signInWithGoogle() async  {
    // try{
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //
    //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    //
    //   final credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth?.accessToken,
    //     idToken: googleAuth?.idToken,
    //   );
    //   await FirebaseAuth.instance.signInWithCredential(credential);
    //   emit(SignInGoogleSuccessState());
    //
    // }
    // catch(error){
    //   print('error in signIn!!!!');
    //   print(error.toString());
    //   emit(GoogleSignInErrorState());
    // }
    await GoogleSignIn().signIn().then((value){
     value!.authentication.then((value){
       final Credential= GoogleAuthProvider.credential(
         accessToken: value.accessToken,
         idToken: value.idToken
       );
       print('id toke is ${value.idToken}');
       print('access token is ${value.accessToken}');
       FirebaseAuth.instance.signInWithCredential(Credential).then((value){
         print('this is credental ${value.credential!.token}');
         token=CasheHelper.SaveData(value: value.credential!.token, key: 'token');
         emit(SignInGoogleSuccessState());

       }).catchError((error){
         print(error.toString());
         emit(GoogleSignOutErrorState());
       });

     }).catchError((error){
       print('there is an error');
       emit(GoogleSignOutErrorState());
     });

    }).catchError((error){
      print(error.toString());
      emit(GoogleSignOutErrorState());
    });

  }

  Future signOut() async {
    try {
      // Sign out of Google Sign-In
      await GoogleSignIn().signOut();

      // Sign out of Firebase
      await FirebaseAuth.instance.signOut();

      print('User signed out successfully');
      emit(GoogleSignOutSuccessState());
    } catch (e) {
      print('Error signing out: $e');
      emit(GoogleSignOutErrorState());
    }
  }

  void startApp(){
    firebaseAuth.authStateChanges().listen((event){
      user=event;
    });
  }

  void handleGoogleSignIn(context){
  try{
    GoogleAuthProvider _googleAuthProvider=GoogleAuthProvider();
    firebaseAuth.signInWithProvider(_googleAuthProvider).then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>TabooScreen()));
      emit(SignInGoogleSuccessState());
    }).catchError((error){
      print('there is an error');
      print(error.toString());
      emit(GoogleSignInErrorState());
    });

  }
  catch(error){

    print(error.toString());
  }
}

  void handleGoogleSignOut(context){

    firebaseAuth.signOut().then((value){

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (ss)=>false);
      emit(GoogleSignOutSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(GoogleSignOutErrorState());
    });



 }







}