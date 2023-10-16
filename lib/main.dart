import 'package:flutter/material.dart';
import 'package:moody/pages/loading.dart';
import 'package:moody/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moody/pages/auth.dart';
import 'package:moody/pages/signup.dart';
import 'package:moody/pages/homePage.dart';
import 'package:moody/pages/quiz.dart';
import 'package:moody/pages/web_site.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Auth(),
      initialRoute: '/',
      routes: {
        '/':(context)=>const Auth(),
        '/login_screen':(context)=>const LoginScreen(),
       '/loading':(context)=>const loading(),
        '/signup':(context)=>const Signup(),
        //'/home':(context)=>const Home_Page(),
        '/homePage':(context)=>const HomePage(),

         '/quiz':(context)=>const QuizScreen(),
        '/Web_Site': (context) =>  Web_Site(),





      },
    );
  }
}

// runApp(MaterialApp(

  // initialRoute: '/auth',
  // routes: {
  //   '/auth':(context)=>Auth(),
  //   '/login_screen':(context)=>LoginScreen(),
  //   '/':(context)=>loading(),
  //   '/home':(context)=>HomePage(),
  //
  //
  //
  // },));


