# README

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

## Usersテーブル

| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |

### Association

- has_many :babies

## Babiesテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| user       | references | null: false, foreign_key: true |
| name       | string     | null: false                    |
| birth_date | date       | null: false                    |
| height     | float      |                                |
| weight     | float      |                                |

### Association

- belongs_to :user
- has_many :feedings
- has_many :diaperchanges
- has_many :diaries

## Feedingsテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| baby         | references | null: false, foreign_key: true |
| feeding_time | datetime   | null: false                    |
| amount       | integer    | null: false                    |

### Association

- belongs_to :baby

## DiaperChangesテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| baby        | references | null: false, foreign_key: true |
| change_time | datetime   | null: false                    |
| type        | string     | null: false, 'wet' or 'dirty'  |

### Association

- belongs_to :baby

## Diariesテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| baby       | references | null: false, foreign_key: true |
| entry_date | date       | null: false                    |
| content    | text       | null: false                    |
| photo      | string     |                                |

### Association

- belongs_to :baby

## Advicesテーブル

| Column     | Type    | Options     |
|------------|---------|-------------|
| age_months | integer | null: false |
| advice     | text    | null: false |