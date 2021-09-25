# テーブル設計

## usersテーブル
| Colum             | Type         | Options        |
|-------------------|--------------|----------------|
| nickname          | string       | null:false     | ニックネーム
| email             | string       | null:false, unique: true  | メルアド
| encrypted_password| string       | null:false     | パスワード
| firstname_kannji  | string       | null:false     | 苗字 漢字
| lastname_kannji   | string       | null:false     | 名前 漢字
| firstname_katakana| string       | null:false     | 苗字 カタカナ
| lastname_katakana | string       | null:false     | 名前 カタカナ
| birthday          | date         | null:false     | 誕生日
- has_many : items
- has_many : buy_items

## itemsテーブル
| Colum             | Type         | Options        |
|-------------------|--------------|----------------|
| item_name         | string       | null:false     | 商品名
| item_explanation  | text         | null:false     | 商品説明
| category_id       | integer      | null:false     | カテゴリー
| send_money_id     | integer      | null:false     | 送料
| todoufukenn_id    | integer      | null:false     | 配送元（都道府県）
| delivery_day_id   | integer      | null:false     | 配送日数
| price             | integer      | null:false     | 価格
| user              | references   |foreign_key: true, null:false     |
-belongs_to : user
-has_one : buy_item


## buy_itemsテーブル

| Colum             | Type       | Options                           |
|-------------------|------------|-----------------------------------|
| user              | references | foreign_key: true, null:false     |
| item              | references | foreign_key: true, null:false     |

-belongs_to : item
-belongs_to : user
-has_one :send

## sendsテーブル
| Colum             | Type         | Options        |
|-------------------|--------------|----------------|
| post_code         | string       | null:false     | 郵便番号
| todoufukenn_id    | integer      | null:false     | 都道府県
| city              | string       | null:false     | 市町村
| city_address      | string       | null:false     | 番地
| building_name     | string       |                | 建物名
| phone_number      | string       | null:false     | 電話番号
| buy_item          | references   | foreign_key: true, null:false    |
-belongs_to :buy_item
