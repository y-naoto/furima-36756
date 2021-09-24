# テーブル設計

## usersテーブル
| Colum             | Type         | Options        |
|-------------------|--------------|----------------|
| nickname          | string       | null:false     | ニックネーム
| email             | string       | null:false     | メルアド
| encrypted_password| string       | null:false     | パスワード
| firstname_kannji  | string       | null:false     | 苗字 漢字
| lastname_kannji   | string       | null:false     | 名前 漢字
| firstname_katakana| string       | null:false     | 苗字 カタカナ
| lastname_katakana | string       | null:false     | 名前 カタカナ
| birthday          | string       | null:false     | 誕生日
- has_many : items

## itemsテーブル
| Colum             | Type         | Options        |
|-------------------|--------------|----------------|
| item_name         | string       | null:false     | 商品名
| seller            | string       | null:false     | 販売者
| item_explanation  | text         | null:false     | 商品説明
| category_id       | string       | null:false     | カテゴリー
| sendmany_id       | string       | null:false     | 送料
| todoufukenn_id    | string       | null:false     | 配送元（都道府県）
| deriveryday_id    | string       | null:false     | 配送日数
| price             | integer      | null:false     | 価格
| user              | references, foreign_key: true | null:false     |
-belongs_to : user
-has_one : buy_item


## buy_itemsテーブル

| Colum             | Type         | Options                         |
|-------------------|--------------|---------------------------------|
| user              | references, foreign_key: true | null:false     |
| item              | references, foreign_key: true | null:false     |
| send              | references, foreign_key: true | null:false     |
-belongs_to : item
-has_one :send

## sendテーブル
| Colum             | Type         | Options        |
|-------------------|--------------|----------------|
| post_code         | string       | null:false     | 郵便番号
| todoufukenn_id    | string       | null:false     | 都道府県
| city              | string       | null:false     | 市町村
| city_address      | string       | null:false     | 番地
| building_name     | string       |                | 建物名
| phone_number      | integer      | null:false     | 電話番号
-belongs_to :buy_item
