import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'my_package/loginaout.dart';
import 'my_package/registpage.dart';
import 'my_package/googlsignin.dart';
//import 'my_package/sample.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
  //name: "fbs2" ,
   options: const FirebaseOptions(

    //apiKey: 'AIzaSyAYaqFmojdi7x7wEdXYPcA7DYhcJzsbu1Y',
    //appId: '1:765193476673:ios:7b288288d6b06cc9adc4c0',
    //messagingSenderId: '765193476673',
    //projectId: 'flutter-sample-tegos',
    //databaseURL: 'https://flutter-sample-tegos-default-rtdb.asia-southeast1.firebasedatabase.app',
    //storageBucket: 'flutter-sample-tegos.appspot.com',
    //iosClientId: '765193476673-228ofgu01hou61ggias3ao57ji7shica.apps.googleusercontent.com',
    //iosBundleId: 'com.example.fbs2',

    apiKey: 'AIzaSyB5M8JSs10L4wS5wj9lKnVHCFyoXxjdp2o',
    appId: '1:765193476673:android:4a795c6f93cdb46badc4c0',
    messagingSenderId: '765193476673',
    projectId: 'flutter-sample-tegos',
    databaseURL: 'https://flutter-sample-tegos-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-sample-tegos.appspot.com',

    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
//class TopPage extends StatefullWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('ログイン'),
              onPressed: () async {
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }),
                );
              },
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              child: Text('アカウント作成'),
              onPressed: () async {
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return RegisterPage();
                  }),
                );
              },
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              child: Text('googleでログイン'),
              onPressed: () async {
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return GoogleSignin();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
