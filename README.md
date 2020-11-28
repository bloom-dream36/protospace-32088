# README

# users テーブル

| Column     | Type   |  Options    |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | text   | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false | 

### Association 

- has_many :prototypes
- has_many :comments

# prototype テーブル

| Column     | Type          |  Options    |
| ---------- | ------------- | ----------- |
| title      | string        | null: false |
| catch_copy | text          | null: false |
| concept    | text          | null: false |
| image      | ActiveStorage |             |
| user       | references    |             |

### Association

- has_many :comments
- belongs_to :user

# comments テーブル

| Column     | type       |  Options    |
| ---------- | ---------- | ----------- |
| text       | text       | nul: false  |
| user       | references |             |
| prototype  | references |             |

- belongs_to :user
- belongs_to :prototype