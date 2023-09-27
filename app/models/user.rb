class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :birth_date,      presence: true
  validates :password,                        format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])/, message: "is invalid. Include both letters and numbers" }
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters" }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters" }
  validates :kana_last_name,  presence: true, format: { with: /\A[\ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :kana_first_name, presence: true, format: { with: /\A[\ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
end