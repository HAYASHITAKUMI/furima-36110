class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :birthday
    validates :nickname
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ } do
    validates :first_name, presence: true
    validates :last_name, presence: true
  end

  with_options format: { with: /\A[ァ-ヶ一-]+\z/ } do
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
  end


  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

end
