class List < ApplicationRecord
  has_one_attached :image #画像を使う宣言

  # vaildation設定
  validates :title,presence: true
  validates :body, presence: true
  validates :image, presence: true
end
