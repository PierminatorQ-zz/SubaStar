class CartController < ApplicationController
  before_action :authenticate_user!
  after_action :update_total


  def pay_success
    @order=current_order
    if params[:status] == "approved"
      @order.payed!
      redirect_to root_path, notice: 'el pago  fue procesado correctamente.' 
    else
      redirect_to carrito_path, notice: 'el pago no fue procesado correctamente.' 
    end
   
  end

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
    

    require 'mercadopago.rb'

    $mp = MercadoPago.new('TEST-1447323506024809-070320-02255dc1854d844b7bf141e8886150d3__LD_LB__-198085952')

    # Crea un objeto de preferencia
      preference_data = {
        "items": [
          {
            "title": "Producto Subastas Subastar",
            "unit_price": @order.total,
            "quantity": 1,
            "currency": "CLP"
          }
        ],
        "back_urls": {
            success: "http://localhost:3000/success",
            failure: "http://www.tu-sitio/failure",
            pending: "http://www.tu-sitio/pendings"
        },
          "auto-return": "approved"

      }

      preference = $mp.create_preference(preference_data)

      # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
      @preference_id = preference["response"]["id"]
      
      

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
