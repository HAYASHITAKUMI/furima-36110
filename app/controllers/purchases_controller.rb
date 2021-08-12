class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  def index
    @purchase_residence = PurchaseResidence.new
    if current_user == @item.user || @item.purchase != nil
      redirect_to root_path
      end
  end
  def create
      @purchase_residence = PurchaseResidence.new(purchase_params)
      if @purchase_residence.valid?
        pay_item
        @purchase_residence.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private
  def purchase_params
    params.require(:purchase_residence).permit(:postal_code, :delivery_id, :address, :building_name, :phone_number, :municipality).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @purchase_residence.valid?
      pay_item
      @purchase_residence.save
      redirect_to root_path
    else
      render action: :index
    end
  end
end

