![Live Study-log](https://user-images.githubusercontent.com/66053927/95008750-a67c0880-0657-11eb-9562-11323d6de567.png)

![cb584b038b16d99ba6997583b72ee157](https://user-images.githubusercontent.com/66053927/95008774-daefc480-0657-11eb-8027-6caffe6eb707.jpg)

## 概要
「オンラインツールを使って勉強仲間を募集しよう！」
LIve-studyは気軽にオンライン勉強会(黙々会)を開催できるサービスです。
## URL
https://live-study.work/
【ゲストログイン】ヘッダーのログインボタンからゲストユーザーとしてログインできます。
## 制作の背景
プログラミング学習をしている時にどうしても一人じゃ捗らない、誰かと少しだけコミニケーションが取りたいと思うことが多々ありました。なので僕はスクールのメンバーを誘ってオンライン黙々かいを開催していました。しかし、開催しても誰も参加してくれないこともありそれが数回続くと開催するときの心理的ハードルが上がり黙々会開催に消極的になっていました。
ふと思ったのが自由に黙々かいを開けて全く知らない人と一緒に勉強できるサービスがあればいいなと思いました。このサービスなら開催する際の心理的ハードルもほとんど無く、またここで新たな勉強仲間や繋がりができたらいいなとも思いました。
## 主な利用シーン
一人で勉強しているときに誰かとコミニケーションをとりたくなったとき
## 機能一覧
* 通知機能 
  - フォローされた時、DMが届いた時、フォローしているユーザーが部屋を開いたとき
* DM機能(ajax)
* フォロー機能
* 部屋検索機能(ransack) 
* 掲示板機能(勉強部屋内で)(ajax)
* 勉強部屋の開催、編集、削除、参加、終了
* ユーザ機能(devise)
* ページネーション(kaminari)

## 工夫した点
* 利用者が使いやすいように直感的に操作できるマテリアルデザインを採用。
* 部屋に参加している時は他の部屋には入れないなどの利用者目線で細かい機能を実装。
* インフラ面では構成管理にAnsibleを採用してインフラをコード化。
* Circleciでのstagingブランチにマージ→masterにマージしたらデプロイされるgitフローを作成。
* 極力ローコストで運用するためにRDS,ACM,ALBなどのマネージドサービスは不使用。
## 環境・使用技術
### フロントエンド
* materialize
* SCSS (BEM)
* JavaScript、jQuery、Ajax
### バックエンド
* Ruby 2.6.5
* Rails 6.0.3
### 開発環境 
* Docker/Docker-compose
* Nginx
* supervisor
* MySQL5.7
### 開発環境インフラ構成図
<img width="921" alt="2b605f1662ec1de1f547ed68cdcb5bc8" src="https://user-images.githubusercontent.com/66053927/95952997-22363c00-0e34-11eb-8a68-9e1400f086f5.png">

### ステージング環境
* Ansibleで本番環境と同様の構成管理
* URL https://stg.live-study.work/
### 本番環境
* AWS (EC2,Route53)
* Let’s Encrypt(SSl証明書)
* MySQL5.7
* Nginx、 Unicorn
* CircleCIを用いて自動デプロイ
* Ansibleで構成管理
### テスト
* Rspec 
### その他使用技術
* 非同期通信 
* Rubocop
### インフラ構成図
<img width="922" alt="651a5a5dc85311f82737c3759233c5f3" src="https://user-images.githubusercontent.com/66053927/95953028-30845800-0e34-11eb-80c9-8b90ad591f58.png">

## ER図
<img width="907" alt="0cd59cb8c5cc8b7779ca85f3506a38fb" src="https://user-images.githubusercontent.com/66053927/95009299-ea710c80-065b-11eb-9e6d-56d4c49a8748.png">

## About me
五年間フレンチの料理人をしていました。2020年5月末からWebエンジニアを目指して勉強中です。



