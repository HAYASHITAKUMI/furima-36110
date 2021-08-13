class PurchaseResidence
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :address, :phone_number, :postal_code, :delivery_id, :municipality, :building_name, :token
  
  with_options presence: true do
    validates :address
    validates :phone_number
    validates :postal_code
    validates :delivery_id
    validates :municipality
    validates :token
    validates :user_id
    validates :item_id
   end

   with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postal_code
   end

   with_options format: { with: /\A\d{10,11}\z/ } do
    validates :phone_number
   end

   with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :delivery_id
   end

  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Residence.create(address: address, phone_number: phone_number, postal_code: postal_code, delivery_id: delivery_id, municipality: municipality, building_name: building_name, purchase_id: purchase.id)
  end
end