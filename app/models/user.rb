class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,           presence: true
  validates :password,           presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i, message: 'には半角英字と半角数字の両方を含めて設定してください'}
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください'}
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください'}
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'には全角カタカナを使用してください'}
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'には全角カタカナを使用してください'}
  validates :birthday,           presence: true

end
