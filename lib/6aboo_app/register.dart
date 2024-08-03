import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
              child:Image(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROAoXwYFnKVG9294-3Fakl9p8IWYvLINagA&s'
                ),
                fit: BoxFit.cover,
              )),
          Padding(
            padding:const EdgeInsetsDirectional.only(
                top: 90
            ),
            child: ClipRRect(
              borderRadius  :const BorderRadius.vertical(top: Radius.circular(80)),

              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration:const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(80),
                      topEnd: Radius.circular(80),
                    ),
                    color: Colors.white
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child:Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_circle_left_outlined,
                                    color: Colors.green[900],
                                    size: 30,
                                  )),
                              const SizedBox(
                                width: 100,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Hello freind',
                                    style: TextStyle(
                                        fontFamily: 'Janna',
                                        fontSize: 16,
                                        color: Colors.black
                                    ),
                                  ),
                                  Text(
                                    'welcome',
                                    style: TextStyle(
                                        fontFamily: 'Janna',
                                        fontSize: 16,
                                        color: Colors.green[900]
                                    ),
                                  )
                                ],
                              )


                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Full Name',
                              style: TextStyle(
                                  fontFamily: 'Janna',
                                  fontSize: 16
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Enter your name',
                                  border:InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey[300]
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              'Mobile number',
                              style: TextStyle(
                                  fontFamily: 'Janna',
                                  fontSize: 16
                              ),
                            ),
                            const SizedBox(
                              height: 8,
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
                                const  SizedBox(
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
                              height: 15,
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                  fontFamily: 'Janna',
                                  fontSize: 16
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Enter phone password',
                                          border:InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.grey[300]
                                      ),
                                    )),
                                const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )

                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              'Confirm password',
                              style: TextStyle(
                                  fontFamily: 'Janna',
                                  fontSize: 16
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Re-enter your password',
                                          border:InputBorder.none,
                                          filled: true,
                                          fillColor: Colors.grey[300]
                                      ),
                                    )),
                                const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )

                              ],
                            ),
                            const SizedBox(
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
                                        'Sign up',
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
                              height: 15,
                            ),
                            const Align(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                'Or Sign up with',
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
                                      'Sign up with Apple',
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
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[900],
                                  borderRadius: BorderRadiusDirectional.circular(15)
                              ),
                              child: MaterialButton(
                                onPressed: (){},
                                child:const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      'Sign up with Facebook',
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
                                      Icons.g_mobiledata,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    Text(
                                      'Sign up with Google',
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
                                ))



                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
  String generateCountryFlag(String flag){
    String countryCode='${flag}';
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'), (match)=>String.fromCharCode(match.group(0)!.codeUnitAt(0)+127397));
  }

}
