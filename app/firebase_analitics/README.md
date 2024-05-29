firebase analyticsの活用事例

- firebase でリアルタイムの分析を debugで行えるようにするコマンド
```sh
$  adb -s YOURDEVICEID shell setprop debug.firebase.analytics.app com.example.firebase_analitics
```



-  流れ
1. firebase analytics SKDをアプリにとりこみ必要な個所にイベントのmethodを仕込む

2. Firebase 搭載アプリを利用しデータがたまる

3. firebase コンソールでデータの可視化



- アプリの解析構成
![alt text](assets/image.png)


- イベント名 を決める

ex)    screen_home :  ホーム画面を表示したときのログをとるなど


![alt text](assets/event.png)



### 独自ユーザセグメントの作成
購入しているユーザとしてないユーザなど、Firebase analyticsではそういったユーザ層を「オーディエンス」という単位で独自に定義し、後ほど紹介するPush通知やA/Bテスト、広告配信などのセグメントとして指定できる。

- OSのバージョン

- デバイス

- 性別

などをフィルタリングにかけることが可能


それらの、オーディエンスはPush通知、A/Bテスト、 広告表示 などに活用できる。


ex) 最新のバージョンをつかっている。かつ広告のタップの回数が5回以上など
販売ができそうなユーザの見極めなどに使用できる


![alt text](assets/audiences.png)



- データを活用した ターゲティング

上記で狙ったオーディエンスにリーチすることが可能

その、購入してほしい層に、お得なクーポンなどを Cloud messageingでけで完結できる

![alt text](assets/cloud_message.png)



### 情報の種類

-  イベント
![alt text](assets/event2.png)

ex) ユーザーがloginした、スクリーンを表示したなど


- パラメータ

![alt text](assets/paramerter.png)

ex) イベントごとに 取得できる値



### 自動的に取得されるイベント

-  first_open      :   ユーザーがアプリをインストールまたは再インストールした後に、初めて起動したときに発生す
                    イベント

- in_app_purchase	 :   	iTunesのApp StoreまたはGoogle Playで処理されるアプリ内購入をユーザーが完了したとき                      に発生するイベント

- notification_open :   Firebase Cloud Messagingから送信された通知をユーザーが開いたときに発生するイベント

- screen_view     :   スクリーンが移動したときに発生するイベント（条件あり）