class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.references :user, foreign_key: true
      
#ちょっとテーブルにいくところ理解怪しい
# tableの参照先をuser にしていたけどmicropostsにする。favはtweetに対してやるものなので。user にしていて間違ってた。
# rollbackしてやりなおした。
# micropostをuser_idとmicropost_idだけで特定できる
      t.references :micropost, foreign_key: true

      t.timestamps

# favのid
      t.index [:user_id, :micropost_id], unique: true

    end
  end
end
