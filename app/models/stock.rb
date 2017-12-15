class Stock < ApplicationRecord
# ここもapplicationrecordでくくれるのかな
  belongs_to :user
# favの所属を宣言,User classでいいのか？
# fav(実際はfav_id)には、「何のモデルデータのid値が入っている？」と考えるとスムーズです
# 「どのモデル」かが「class_name」で指定することで、fav_idがどこと紐付いているかrailsにシラせるわけです

# favするのはmicropostなのでclassnameはuserではなくmicropostへ。間違ってたので注意。
  belongs_to :micropost



#validationさせる userもココでサイドする必要あり？application Recordでくくったほうがいいのかね
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  
end
