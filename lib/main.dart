import 'package:flutter/material.dart';
import 'package:flutter_task/Providers/model_hud.dart';
import 'package:flutter_task/Providers/userData.dart';
import 'package:flutter_task/Screens/Auth/loginScreen.dart';
import 'package:flutter_task/Screens/Auth/signupScreen.dart';
import 'package:flutter_task/Screens/mainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Modelhud>(create: (context) =>Modelhud(),),
        ChangeNotifierProvider<UserData>(create: (context) => UserData(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id:(ctx) => MainScreen(),
          LoginScreen.id:(ctx)=>LoginScreen(),
          SignUpScreen.id:(ctx)=>SignUpScreen(),
        },
      ),
    );
  }
}
