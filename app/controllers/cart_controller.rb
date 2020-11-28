class CartController < ApplicationController
  before_action :authenticate_user!
  after_action :update_total

  def destroy
    @order=current_order
    @item= OrderAuction.find(params['cart']['item'])
    @item.destroy
    
    respond_to do |format|
      
      format.html { redirect_to carrito_path, notice: 'item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @order=current_order
    @orders = current_order.order_auctions.all
    
  end

  def update_total
    sum = 0
    if !@orders.nil?
      @orders.each do |item|
        sum += item.price
      end
      current_order.update_attribute(:total, sum)
    end
  end
end
