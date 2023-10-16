import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:moody/pages/home.dart';
import 'package:moody/pages/web_site.dart';
import 'package:moody/pages/sign_out.dart';
import 'history.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;
  late String email;
  late String username;
  late String name;
  late final String _formattedDate;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
    email = user.email!;
    username = email.substring(0, email.indexOf('@'));
    name = username.split('.').map((word) => capitalize(word)).join(' ');

    _formattedDate = DateFormat('yyyy-MM-dd ').format(DateTime.now());
  }
  String capitalize(String word) {
    return '${word[0].toUpperCase()}${word.substring(1)}';
  }
int index=0;
final pages=[
  Home(),
  Web_Site(),
  History(),
  Sign_out(),


];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index)=> setState(() =>this.index=index),
        height: 60,
        destinations:[
          NavigationDestination(
            icon:Icon(Icons.home_outlined),
            selectedIcon:Icon(Icons.home),
            label:'Home',),
          NavigationDestination(
            icon:Icon(Icons.public),
            selectedIcon:Icon(Icons.public),
            label:'web sites',),
          NavigationDestination(
            icon:Icon(Icons.history_outlined),
            selectedIcon:Icon(Icons.history_outlined),
            label:'history',),
          NavigationDestination(
            icon:Icon(Icons.person),
            selectedIcon:Icon(Icons.person),
            label:'logout',),
        ],

      ),

    );
  }
}
