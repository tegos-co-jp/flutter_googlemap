import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'my_package/loginaout.dart';
import 'my_package/registpage.dart';
import 'my_package/resetpass.dart';
import 'my_package/googlsignin.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


//import 'my_package/sample.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

//void main() async {
  Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv().load(fileName: '.env');
//print(dotenv.get('VAR_NAME'));
//print('');
  await Firebase.initializeApp(
    name: "fbs2" ,


  //options: firebaseOptions,
   options: DefaultFirebaseOptions.currentPlatform,
   //options: FirebaseOptions(
    //apiKey: DotEnv().env['FirebaseOptions_ios_apiKey']?? "Null", 
    //appId: DotEnv().env['FirebaseOptions_ios_appId']?? "Null", 
    //messagingSenderId: DotEnv().env['FirebaseOptions_ios_messagingSenderId']?? "Null", 
    //projectId: DotEnv().env['FirebaseOptions_ios_messagingSenderId']?? "Null",
    //databaseURL: DotEnv().env['FirebaseOptions_ios_databaseURL']?? "Null",
    //storageBucket: DotEnv().env['FirebaseOptions_ios_storageBucket']?? "Null",
    //iosClientId: DotEnv().env['FirebaseOptions_ios_iosClientId']?? "Null",
    //iosBundleId: DotEnv().env['FirebaseOptions_ios_iosBundleId']?? "Null",  
    //apiKey:  Env.FirebaseOptions_ios_appId,
    //appId: Env.FirebaseOptions_ios_appId,
    //messagingSenderId: Env.FirebaseOptions_ios_messagingSenderId,

  //),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirebaseDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('ログイン'),
              onPressed: () async {
                //await Navigator.of(context).pushReplacement(
                  //MaterialPageRoute(builder: (context) {
                    //return LoginPage();
                  //}),
                //);
                 await Navigator.of(context).push(
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
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return RegisterPage();
                  }),
                );
              },
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              child: Text('パスワード再設定'),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ResetPass();
                  }),
                );
              },
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              child: Text('googleでログイン'),
              onPressed: () async {
                await Navigator.of(context).push(
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
