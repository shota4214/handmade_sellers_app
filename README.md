# README

## バージョン
* Ruby 3.0.1
* Ruby on Rails 6.0.3

## アプリケーションについて
* handmade_sellersは個人や小規模で商品を作り販売しているハンドメイド作家さんに使ってほしいツールです。
* ハンドメイド作家さんが抱えている在庫管理や原価計算、棚卸しなどを一括で管理できるアプリです。

## handmade_sellersでできること
* 材料の仕入れ〜販売まで一貫して管理することができます。
* 材料から商品を登録することで原価や販売価格の設定ができます。
* 販売している場所（webサイトやフリマなど）を登録し、ショップごとの売上管理もできます。

## 準備
```
$ git clone https://github.com/shota4214/handmade_sellers_app.git
$ cd handmade_sellers_app
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## アプリケーション実行
```
$ rails s
```
## カタログ設計・テーブル定義
https://docs.google.com/spreadsheets/d/1Kbp2GPb9Tdv_IFIjxgH8OzfN3hTEb6OJJD8HasccCCA/edit?usp=sharing
## ER図
![handmade sellers drawio](https://user-images.githubusercontent.com/104758322/191416560-747d6df3-d331-40ce-af10-d96485d67858.png)
## ワイヤーフレーム
<img width="858" alt="ワイヤーフレーム" src="https://user-images.githubusercontent.com/104758322/191416504-567f4fa0-0747-45a0-9fe0-d1288d55116c.png">