# README

## サービス概要
・Netflix、Huluの使用している方どちらかを選択し、更にシチュエーション（テンション上げたい、チルしたい、ハラハラしたい）を選択し、その中からランダムで映画を選んでくれるアプリ。
## ターゲット
・Netflix、Huluなどのサブスクを暇つぶしに使用したい時に、見たいものが決まっておらず、数多くの作品の中から選択するのが面倒な人向け。
## サービス詳細
　　・ユーザー
①ユーザーは、NetflixかHuluか選択する。
<img width="1440" alt="スクリーンショット 2022-10-27 21 26 49" src="https://user-images.githubusercontent.com/87309077/198302278-bdec9f23-f64e-4b77-8f4b-955d03471afc.png">

②次に、映画を見たいシチュエーションを選択する。『テンション上げたい』、『チルした』、『ハラハラしたい』。
<img width="1440" alt="スクリーンショット 2022-10-27 21 27 13" src="https://user-images.githubusercontent.com/87309077/198302654-421fbb56-9dcf-4d01-b044-2d62a7a67d1c.png">

③シチュエーションを選択したら、ランダムでそのシチュエーションに合った映画が出てくる。
<img width="1440" alt="スクリーンショット 2022-10-27 21 34 31" src="https://user-images.githubusercontent.com/87309077/198302794-c59bb6fa-3edc-404c-947f-2f08167d2e5f.png">


④ユーザー登録者は、お気に入り機能を使ってランダムで出てきた映画を保存することが出来る。
<img width="1440" alt="スクリーンショット 2022-10-27 21 34 43" src="https://user-images.githubusercontent.com/87309077/198302946-30fe9929-e419-4aad-89f7-f96084057297.png">

## ユーザー画面
![ポートフォリオ](https://user-images.githubusercontent.com/87309077/198318505-c07d2576-3d02-42b8-b7b3-780131ad3ede.gif)


　　　　『シチュエーション』・・・APIから取得した映画のジャンル（アクション、ホ　　　　ラー、コメディ、など）を合わせたもの。例：『テンション上げたい時』　　　　　　　→APIから取得した「Netflixの全アクション」＋「Netflixの全コメディ」
　　　　『寝る前に』→APIから取得したサブスクのジャンル「Netflixの全ロマンス」＋　　　　「Netflixの全ファミリー」

　　　　
## 機能一覧
・ユーザー登録機能
・お気に入り機能（ランダムで選択された映画の画面に『見たい』ボタンがあ　りユーザー画面で『見たい映画一覧』で確認できるようにしたいです）
・管理者機能

