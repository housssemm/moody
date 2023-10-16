import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moody/pages/login_screen.dart';
import 'package:moody/pages/loading.dart';
import 'package:moody/pages/sign_out.dart';
import 'package:moody/pages/homePage.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot){
      if(snapshot.hasData){
      return const loading();
      }else{
      return const LoginScreen();
      }
      }),
      ),
    );
  }
}
