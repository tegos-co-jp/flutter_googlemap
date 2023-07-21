import '/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String _email = '';
  String _password = '';
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // メールアドレス入力
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              Container(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                  child: Text('ユーザ登録'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザ登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.createUserWithEmailAndPassword(
                        email: _email.trim(),
                        password: _password.trim(),
                      );

                      // ユーザー登録に成功した場合
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return TopPage();
                        }),
                      );
                    } catch (e) {
                      // ユーザー登録に失敗した場合
                      setState(() {
                        infoText = "登録に失敗しました：${e.toString()}";
                      });
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
              ),
              Container(
                width: double.infinity,
                // 戻るボタン
                child: ElevatedButton(
                  child: Text('戻る'),
                  onPressed: () async {
                    //await 
                    Navigator.of(context).pop(
                      //MaterialPageRoute(builder: (context) {
                        //return TopPage();
                     // }),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
