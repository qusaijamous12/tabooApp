import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  User  ?_user;
  @override
  void initState() {
    super.initState();
    _firebaseAuth.authStateChanges().listen((event){
      setState(() {
        _user=event;
      });

    });


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _user!=null ? _userInfo():_googleSignInButton(),
    );
  }

  Widget _googleSignInButton(){
    return Center(
      child: SizedBox(height: 50,
      child: TextButton(
        onPressed: _handleGoogleSignIn,
        child: Text(
          'Sign in google'
        ),
      ),
      ),
    );
  }

  Widget _userInfo(){
    return SizedBox(
      height: 20,
      child: Text(
        'Hello Qusai'
      ),
    );
  }

  void _handleGoogleSignIn(){
    try{
      GoogleAuthProvider _googleAuthProvider=GoogleAuthProvider();
      _firebaseAuth.signInWithProvider(_googleAuthProvider);

    }
    catch(error){

      print(error.toString());
    }
  }

}
