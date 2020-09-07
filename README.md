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
| birth_day | integer | null: false |

### Association
- has_many :items
- has_one :purchasers
- has_one :addresses

## Items テーブル

| Column | Type | Options |
|:----|:----|:----|
| image | ActiveStorage | null: false |
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| postage_id | integer | null: false |
| prefecture_id | integer | null: false |
| handling_time_id | integer | null: false |
| price | integer | null: false |
| references | foreign_key:true,null: false | |

### Association
-belongs_to :users
-has_one :purchasers
-has_many :addresses

## Purchasers テーブル

| Column | Type | Options |
|:----|:----|:----|
| references | foreign_key: true,null: false | |
| references | foreign_key: true,null: false | |

### Association
-has_one :users
-has_one :items
-has_one :addresses

## Addresses テーブル

| Column | Type | Options |
|:----|:----|:----|
| post_code | string | null: false |
| prefecture | integer | null: false |
| city |string | null: false |
| address | string | null: false |
| building_name | string | |
| phone_number | string | null: false |

### Association
-has_one :users
-has_one :items
-has_one :purchasers

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
