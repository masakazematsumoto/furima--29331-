# README
# テーブル設計

## Users テーブル

| Column | Type | Options |
|:----|:----|:----|
| nickname | string | null: false |
| email | string | null: false |
| password | string | null: false |
| family_name | string | null: false |
| first_name |string | null: false |
| family_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_day | date | null: false |

### Association
- has_many :items
- has_many :purchasers

## Items テーブル

| Column | Type | Options |
|:----|:----|:----|
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| postage_id | integer | null: false |
| prefecture_id | integer | null: false |
| handling_time_id | integer | null: false |
| price | integer | null: false |
| user | references |foreign_key:true,null: false | |

### Association
-belongs_to :user
-has_one :purchaser

## Purchasers テーブル

| Column | Type | Options |
|:----|:----|:----|
| user | references | foreign_key: true,null: false |
| item | references | foreign_key: true,null: false |

### Association
-belongs_to :user
-belongs_to :item
-has_one :address

## Addresses テーブル

| Column | Type | Options |
|:----|:----|:----|
| post_code | string | null: false |
| prefecture_id | integer | null: false |
| city |string | null: false |
| address | string | null: false |
| building_name | string | |
| phone_number | string | null: false |
| purchaser | references | foreign_key:true,null: false | 

### Association
-belongs_to :purchaser

・GitHub
　https://github.com/masakazematsumoto/furima--29331-.git

・huloku
　https://furima-29331.herokuapp.com/
　Herokuでデプロイしているため、Herokuの仕様により本番環境にアクセス頂いた際に画像リンクが切れている可能性がございます。 
・basic認証
　username == 'cocoa'
　password == '29331'

・Rubyバージョン
   ruby 2.6.5p114

・フリーマーケットアプリ
　誰でも商品を出品でき、他社が出品した商品を購入できる。
　作成期間 2020/9/3~2020/10/1

・主な使用言語
　Ruby

・ 機能紹介
　商品を出品し、購入できる。

・テスト用アカウント等
　購入者用 　　メールアドレス: vvv@sample.com 　　パスワード: cocoa1234 　購入用カード情報 　　番号：4242424242424242 　セキュリティコード：123 　
　出品者用 　　メールアドレス: zzz@sample.com 　　パスワード: cocoa7777 
 
・追加実装
 画像プレビュー表示機能
 エラーメセージ日本語化
