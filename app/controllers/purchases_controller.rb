class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @purchase_residence = PurchaseResidence.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.purchase != nil      #売り切れ商品なら（@itemに紐づくpurchaseテーブルの情報が存在すれば）
      redirect_to root_path
      end
  end
  def create
      @purchase_residence = PurchaseResidence.new(purchase_params)
      @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_c265199bbafbc7b8d41e4d73"
    Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency: 'jpy'
    )
  end
end

