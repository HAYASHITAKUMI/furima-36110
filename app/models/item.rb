class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :days_delivery
  belongs_to :delivery
  belongs_to :status
  belongs_to :user

  has_one_attached :purchase
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :delivery_id
    validates :days_delivery_id
    validates :price
    validates :image
   end

   validates :price, inclusion: { in: 300..9999999 }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
end