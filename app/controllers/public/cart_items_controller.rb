class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
    @order = Order.new
  end

  def update
    # @item = Item.find_by(item_id: params[:cart_item][:item_id])
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path

  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def all_destroy
    CartItem.destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path, notice: 'カートが空になりました。'
  end

  def create
    #item_idでカート内に同じitem_idのものを探す
    @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    #カートに入れた商品と入っていた商品に同じものがあったら、数量を加算なかったら、商品追加
    if @cart_item
      @cart_item.amount += CartItem.new(cart_item_params).amount.to_i
    else
      @cart_item = CartItem.new(cart_item_params)
    end
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end