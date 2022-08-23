class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,     null: false
      t.text :catch_copy,  null: false
      t.text :concept,     null: false
      t.references :user,  null: false, foreign_key: true
      # foreign_key: true によって外部キー制約をつけている。この制約をつけることにより、user_idがないとDBに保存ができないようになっている。
      # もしこの制約を付けなかった場合、user_idカラムが空になったり、そこに意図しない値が保存されてしまう可能性があり、そうなるとエラーが起こってしまう。
      t.timestamps
    end
  end
end
