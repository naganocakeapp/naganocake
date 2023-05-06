class Public::ItemsController < ApplicationController
  def index
    @item = Item.page(params[:page]).per(8)
    @count_item = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
