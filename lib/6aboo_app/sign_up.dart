import 'package:flutter/material.dart';

class ForgetPasswrod extends StatelessWidget {
  const ForgetPasswrod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image(
          //   height: double.infinity,
          //   width: double.infinity,
          //   image: NetworkImage(
          //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROAoXwYFnKVG9294-3Fakl9p8IWYvLINagA&s'
          // ),
          //   fit: BoxFit.cover,
          // )
          const Positioned.fill(
              child:Image(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROAoXwYFnKVG9294-3Fakl9p8IWYvLINagA&s'
                ),
                fit: BoxFit.cover,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(40),
                      topEnd: Radius.circular(40),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppBar(
                            backgroundColor: Colors.white,
                            centerTitle: true,
                            shape:const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(40),
                                    topEnd: Radius.circular(40)
                                )
                            ),
                            leading: IconButton(
                              onPressed: (){
                                Navigator.pop(context);

                              },
                              icon: Icon(
                                Icons.arrow_circle_left_outlined,
                                size: 30,
                                color: Colors.green[900],
                              ),
                            ),
                            title: Column(
                              children: [
                                const Text(
                                  'Forgot password',
                                  style: TextStyle(
                                    fontFamily: 'Janna',
                                    fontSize: 20,
                                    color: Colors.black,

                                  ),
                                ),
                                Text(
                                  'Reset',
                                  style: TextStyle(
                                    fontFamily: 'Janna',
                                    fontSize: 20,
                                    color: Colors.green[900],

                                  ),
                                ),


                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Janna',
                                    fontSize: 18
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_drop_down_circle_outlined,
                              ),
                              SizedBox(
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
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Container(
                              width: 160,
                              color: Colors.black,
                              child: MaterialButton(
                                onPressed: (){

                                },
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Send Code',
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
                            height: 62,
                          ),

                          const Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Text(
                              'Copyrights Reserved @ 6abpp platform 2024',
                              style: TextStyle(
                                  fontFamily: 'Janna'
                              ),
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
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
