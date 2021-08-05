class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :burden_id, :delivery_id, :days_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user == @item.user
  end

end
