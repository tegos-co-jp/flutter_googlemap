import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'my_package/loginaout.dart';
import 'my_package/registpage.dart';
import 'my_package/resetpass.dart';
import 'my_package/googlsignin.dart';
import 'firebase_options.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

//import 'my_package/sample.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

//void main() async {
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await DotEnv().load(fileName: '.env');
//print(dotenv.get('VAR_NAME'));
//print('');
  await Firebase.initializeApp(
    name: "fbs2",

    //options: firebaseOptions,
    options: DefaultFirebaseOptions.currentPlatform,
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
