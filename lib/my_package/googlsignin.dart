import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'sample.dart';

class GoogleSignin extends StatelessWidget {
  const GoogleSignin({Key? key}) : super(key: key);

  // ↓ここから公式の処理を丸パクリ
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  // ↑ここまで公式の処理を丸パクリ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Login')),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              // サインイン画面を表示する
              signInWithGoogle();
              // 猫一覧画面を表示する
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>  SaHomePage()));
            },
            child: const Text('Google'),
          )
        ]),
      ),
    );
  }
}

//void
//Future<UserCredential> googleAuthentication() async {
  //String infoText = '';

  //Google認証フローを起動する
//  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //リクエストから認証情報を取得する
 // final googleAuth = await googleUser?.authentication;
  //developer.log('debugPrint() - kDebugMode : $googleAuth');
//  Text('$googleAuth');
  //debugPrint('movieTitle: $googleAuth');
  //firebaseAuthで認証を行う為、credentialを作成
//  final credential = GoogleAuthProvider.credential(
//    accessToken: googleAuth?.accessToken,
//    idToken: googleAuth?.idToken,
//  );
//  String infoText;
//  String? aaa = credential.accessToken;
//  Text('debugPrint() - kDebugMode : $aaa');
  //setState(() {
//  infoText = "${aaa}";
//  print(infoText);
  //});
//  aaa = credential.idToken;
//  Text('debugPrint() - kDebugMode : $aaa');
  //setState(() {
//  infoText = "${aaa}";
//  print(infoText);
  //});
  //作成したcredentialを元にfirebaseAuthで認証を行う
  //UserCredential userCredential =
  //await FirebaseAuth.instance.signInWithCredential(credential);
//  return await FirebaseAuth.instance.signInWithCredential(credential);
//}
