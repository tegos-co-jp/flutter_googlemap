import '/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPass extends StatefulWidget {
  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String _email = '';
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
              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),
              Container(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                  child: Text('パスワード再設定(email入力後、gmailにパスワードの再設定メールが送られます)'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザ登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.sendPasswordResetEmail(
                        email: _email.trim(),
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
