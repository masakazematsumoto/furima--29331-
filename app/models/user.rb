class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchasers

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ ,message: "is Full-width characters"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ ,message: "is Full-width characters"}
    validates :family_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/ ,message: "is Full-width characters"}
    validates :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/ ,message: "is Full-width characters"}
    validates :birth_day
  end

  validates :email, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :encrypted_password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i ,message: "doesn't match Password"}, length: { minimum: 6 }

end