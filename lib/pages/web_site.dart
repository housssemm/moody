import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Web_Site extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('We suggest some websites to help you'),
      ),
      body: Center(
        child: Card(
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  launch('https://www.calm.com/');
                },
                child: Image.asset(
                  'images/calm.png',
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch('https://www.calm.com/');
                },
                child: ListTile(
                  title: Text('Calm'),
                  subtitle: Text('https://www.calm.com/'),
                  trailing: Icon(Icons.favorite_border),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  ' Calm is a meditation and relaxation app that offers guided meditations, breathing exercises, and sleep stories. The app is designed to help you reduce stress and anxiety, and improve your overall well-being.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),

              Divider(
                height: 70.0,
                color: Colors.black,
              ),

              GestureDetector(
                onTap: () {
                  launch('https://mymoodfit.com/');
                },
                child: Image.asset(
                  'images/moodfit.png',
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch('https://mymoodfit.com/');
                },
                child: ListTile(
                  title: Text('Moodfit'),
                  subtitle: Text('https://mymoodfit.com/'),
                  trailing: Icon(Icons.favorite_border),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Moodfit is a free app that offers personalized mental wellness support. The app provides daily mood tracking, guided meditations, journaling prompts, and a community of users for support.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),










              Divider(
                height: 70.0,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () {
                  launch('https://www.happify.com/');
                },
                child: Image.asset(
                  'images/Happify .png',
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () {

                  launch('https://www.happify.com/');
                },
                child: ListTile(
                  title: Text('Happify'),
                  subtitle: Text('https://www.happify.com/'),
                  trailing: Icon(Icons.favorite_border),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Happify is a science-based app that offers activities and games to help you build resilience, reduce stress, and improve your mood. The app uses positive psychology techniques to help you focus on the good things in your life.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),

              Divider(
                height: 70.0,
                color: Colors.black,
              ),
        GestureDetector(
          onTap: () {
            launch('https://mymoodfit.com/');
          },
          child: Image.asset(
            'images/SuperBetter.png',
            width: 200,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            launch('https://www.superbetter.com/');
          },
          child: ListTile(
            title: Text('SuperBetter'),
            subtitle: Text('https://www.superbetter.com/'),
            trailing: Icon(Icons.favorite_border),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'SuperBetter is a free app that helps you build resilience and overcome challenges. The app provides games and activities that are designed to help you develop positive habits and cope with stress.',
            style: TextStyle(fontSize: 16.0),
          ),
        ),

            ],
          ),
        ),
      ),
    );
  }
}