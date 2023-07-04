### flutterのインストール方法
#### Macの場合
1. Flutter 公式 HPの「Install」ページでmacOS を選択
2. 「Get the Flutter SDK」 から zip ファイルをダウンロードし解凍
3.  ユーザーフォルダ直下に「development」フォルダを作成し、ダウンロードした「flutter」フォルダを移動
4. ターミナルを起動して vim .zshrc(vim ~/.zshrc)を実行(シェルがzshの場合)
5. export PATH="$PATH:[flutterフォルダが格納されているディレクトリ]/flutter/bin" を入力する
6. シェルを再読み込みし、which flutterを実行した時、パスが表示されれば成功。
### flutterの特徴
1. Flutterはプログラミング言語Dartのフレームワーク
2. FlutterのUIを構築しているパーツのことをWidgetと呼びます。
様々なWidgetを組み合わせることで複雑なUIを構築しているのです。
3. WidgetにはStatelessWidgetとStatefulWidgetの二つのWidgetがあります。
4. StatelessWidgetでは画面は再描画されません。
5. StatefullWidgetでは画面は再描画できます。
6. 画面の遷移にはpushとpop(スタック)を使います。
7. 新しい画面に遷移するにはpush,前の画面に戻るにはpopを使います。


### ファイルの作成方法
1. ターミナルからコマンドを実行する
$ flutter create helloworld
#####    (プロジェクト名helloworldの作成方法)
### Androidエミュレータの作成方法
1. Android Studio 公式 HPからダウンロードし、案内に従ってインストールする
2. Flutter、Dart のプラグインを導入するためPluginsに移動する。
3. Plugins でflutterと検索し、Flutter、Dart をインストールする(DartはFlutteをインストールすれば自動的にインスト ールされるはず)
4. welcome to android studioのページの右側にある３点リーダをクリックし、vertual device managerのページへいく。
5. create devicesで新しいデバイスが作れる。
### iosシュミレータの作成方法
1. Xcode をAppStoreからダウンロードする
2. 最新機種のiosシュミレータはそのときできているはず。
3. それ以外はwindowからdevice and sumilater で作れるはず。
### vscodeの設定
1. 拡張機能でflutterをインストール
2. エミュレータを起動するには右下に書いてあるデバイスの種類を変える。
### firebaseの設定
1. https://firebase.google.com から始めます。
2. 右上の Go to console をクリックします。
3. 新規プロジェクトを作成ボタンを押してプロジェクト名などを入力します。
4. プロジェクトをローカルで起動します。
5. ターミナルからnpm install -g firebase-tools でCLIのインストールをしてfirebase loginを実行します
6. 作成したfultterプロジェクトのルートから、firebase initを実行してfirebaseの使いたい機能を選択します。
7. その他の設定は自分で決めてください。基本的に全てyesでいいと思います。
8. flutterfire configureを実行して、Flutter アプリを Firebase に接続するように構成します。
9. firebaseのサービスを使うにはapikeyなどが必要です。firebaseのサイトのautencation-sign-in methodのログインプロバイダのサービスを1つ以上有効にする。プロジェクトの設定- 全般に表示される。
### firebase-hosting(flutter)
1. firebaseサイドナビの「開発 → Hosting」を選択
「始める」を選択
2. firebase initを実行した時にHosting: Configure and deploy Firebase Hostingを選択します。
3. flutter build web --web-renderer htmlと実行してビルドします。(web版)
(その他はflutter run でok)
4. firebase deploy --only hostingを実行してwebで見れるよになります
### firebase-auth(flutter)
1. firebaseサイドナビの「開発 → Authentication」を選択
2. flutter プロジェクトのルートから、flutter pub add firebase_authを実行しプラグインをインストールします。
3. プラグインを コードにインポートします。
import 'package:firebase_auth/firebase_auth.dart';
4. ログイン認証のコードを書きます。
5. flutter run またはflutter buildで再ビルドします。
6. googleアカウントでサインインするにはさらにgoogle_sign_inをインポートしてコードを書きます


Error output from CocoaPods: ↳ [!] Automatically assigning platform `iOS` with version `11.0` on target `Runner` because no platform was specified. Please specify a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.

./ios/Podfile を一度消す rm ios/Podfile

Error (Xcode): Building for iOS Simulator, but linking in object file built for iOS, file

1. プロジェクトのBuild SettingsのExcluded ArchitecturesのDebugとReleaseにAny iOS Simulator SDK arm64を追加することでarm64を除外します。
2. PodsのBuild SettingsのExcluded ArchitecturesのDebugとReleaseにもAny iOS Simulator SDK arm64を追加することでarm64を除外します。

ERROR:flutter/lib/ui/ui_dart_state.cc(209)] Unhandled Exception: [core/duplicate-app] A Firebase App named "[DEFAULT]" already exists

flutter clean
と

flutter pub get