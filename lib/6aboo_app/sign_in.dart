import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlesignin/6aboo_app/cubit/cubit.dart';
import 'package:googlesignin/6aboo_app/cubit/state.dart';
import 'package:googlesignin/6aboo_app/home_screen_taboo.dart';
import 'package:googlesignin/6aboo_app/register.dart';
import 'package:googlesignin/6aboo_app/sign_up.dart';
import 'package:googlesignin/constatnt/observer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: Stack(
          children: [
            const Positioned.fill(
                child:Image(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROAoXwYFnKVG9294-3Fakl9p8IWYvLINagA&s'
                  ),
                  fit: BoxFit.cover,
                )),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(60),
                      topStart: Radius.circular(60)
                  )
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child:  Column(
                    children: [
                      const Text(
                        'Hello friend',
                        style: TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 18
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'welcome back',
                        style: TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 18,
                            color: Colors.green[900]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mobile number',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Janna',
                                  fontSize: 18
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '+962   ${generateCountryFlag('jo')}',
                                  style:const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Janna',
                                      fontSize: 18
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Enter phone number',
                                          border:InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.grey[300]
                                      ),
                                    ))

                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                  fontFamily: 'Janna',
                                  fontSize: 18
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Enter your password',
                                        border:InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.grey[300]
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon:const Icon(
                                        Icons.visibility_off
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswrod()));
                              },
                              child:const Text(
                                'Forgot password',
                                style: TextStyle(
                                    fontFamily: 'Janna',
                                    fontSize: 18,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            const SizedBox (
                              height: 20,
                            ),
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Container(
                                width: 180,
                                color: Colors.black,
                                child: MaterialButton(
                                  onPressed: (){

                                  },
                                  child:const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.key,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Sign in',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Janna'
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Container(
                                width: 180,
                                color: Colors.green[900],
                                child: MaterialButton(
                                  onPressed: (){

                                  },
                                  child:const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.key,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Continue as guest',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Janna'
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t have account?',
                                  style: TextStyle(
                                      fontFamily: 'Janna',
                                      fontSize: 16

                                  ),
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                                    },
                                    child: Text(
                                      'Sign up now',
                                      style: TextStyle(
                                          fontFamily: 'Janna',
                                          color: Colors.green[900],
                                          fontSize: 16
                                      ),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Align(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                'Or Sign in with',
                                style: TextStyle(
                                    fontFamily: 'Janna',
                                    fontSize: 16

                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadiusDirectional.circular(15)
                              ),
                              child: MaterialButton(
                                onPressed: (){},
                                child:const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.apple_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Sign in with Apple',
                                      style: TextStyle(
                                          fontFamily: 'Janna',
                                          color: Colors.white,
                                          fontSize: 16
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // sigin in facebook
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[900],
                                  borderRadius: BorderRadiusDirectional.circular(15)
                              ),
                              child: BlocConsumer<AppCubit,AppState>(
                                listener: (context,state){
                                  if(state is FaceBookSignInSuccess)
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>TabooScreen()), (x)=>false);
                                },
                                builder: (context,state){
                                  return  MaterialButton(
                                    onPressed: (){

                                      AppCubit.get(context).signInWithFacebook();

                                    },
                                    child:const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.facebook,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        Text(
                                          'Sign in with Facebook',
                                          style: TextStyle(
                                              fontFamily: 'Janna',
                                              color: Colors.white,
                                              fontSize: 16
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // sign in google

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadiusDirectional.circular(15)
                              ),
                              child: BlocConsumer<AppCubit,AppState>(
                                listener: (context,state){
                                  if(state is SignInGoogleSuccessState){
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>TabooScreen()), (s)=>false);
                                  }
                                },
                                builder: (BuildContext context, state) {
                                  return MaterialButton(
                                    onPressed: (){
                                       AppCubit.get(context).signInWithGoogle();

                                    },
                                    child:const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.g_mobiledata,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        Text(
                                          'Sign in with Google',
                                          style: TextStyle(
                                              fontFamily: 'Janna',
                                              color: Colors.white,
                                              fontSize: 16
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                                text: TextSpan(
                                    children: [
                                      const TextSpan(
                                          text: 'By completing login you agree on ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Janna'
                                          )
                                      ),
                                      TextSpan(
                                          text: 'Privacy policy and terms of use',
                                          style: TextStyle(
                                              color: Colors.green[900],
                                              fontSize: 16,
                                              fontFamily: 'Janna',
                                              decoration: TextDecoration.underline
                                          )
                                      )
                                    ]
                                )),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),


          ],
        )

    );
  }

  String generateCountryFlag(String flag){
    String countryCode= '${flag}';
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'), (match)=>String.fromCharCode(match.group(0)!.codeUnitAt(0)+127397));
  }

  Future signInWithGoogle() async  {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

  }



  // void _handleGoogleSignIn(){
  //   try{
  //     GoogleAuthProvider _googleAuthProvider=GoogleAuthProvider();
  //     _firebaseAuth.signInWithProvider(_googleAuthProvider).then((value){
  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>TabooScreen()));
  //     }).catchError((error){
  //       print('there is an error');
  //       print(error.toString());
  //     });
  //
  //   }
  //   catch(error){
  //
  //     print(error.toString());
  //   }
  // }


}

