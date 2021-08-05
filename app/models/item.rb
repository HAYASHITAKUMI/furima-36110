class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden, :category, :days_delivery, :delivery, :status
  belongs_to :user
  has_one_attached :purchase
  has_one_attached :image

  validates :product_name,     presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :burden_id,        presence: true
  validates :delivery_id,      presence: true
  validates :days_delivery_id, presence: true
  validates :price,            presence: true


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
end