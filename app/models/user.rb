class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, inclusion: { in: ["@"] }
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])/
  validates :encrypted_password, presence: true, uniqueness: true, format: { with: VALID_PASSWORD_REGEX,message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
  validates :birthday, presence: true
end