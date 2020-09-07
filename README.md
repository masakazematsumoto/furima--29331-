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
-has_one :purchaser



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
