import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googlesignin/6aboo_app/cubit/cubit.dart';
import 'package:googlesignin/6aboo_app/home_screen_taboo.dart';
import 'package:googlesignin/6aboo_app/register.dart';
import 'package:googlesignin/6aboo_app/sign_in.dart';
import 'package:googlesignin/firebase_options.dart';
import 'package:googlesignin/home_Screen.dart';

import 'constatnt/observer.dart';
import 'helper/cashe_helper.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  Bloc.observer = MyBlocObserver();
  await CasheHelper.init();

  googleToken=CasheHelper.GetData(key: 'token');
  facebookToken=CasheHelper.GetData(key: 'facebookToken');
  print(googleToken.toString());
  print(facebookToken.toString());
 late Widget StartScreen;
  if((googleToken==null ||googleToken=='') && (facebookToken==null || facebookToken=='')){
    StartScreen=LoginScreen();
  }
  else
    {
      StartScreen=TabooScreen();
    }

  runApp(MyApp(StartScreen));
}

class MyApp extends StatelessWidget {

  Widget ?StartWidget;
 MyApp(this.StartWidget);
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>AppCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home:StartWidget,
      ),
    );
  }
}

