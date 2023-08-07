class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: "must contain at least one letter and one digit" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "Input full-width characters" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: "Input full-width characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "Input full-width Katakana caracters" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "Input full-width Katakana caracters" }
  validates :birthday, presence: true
  
end
