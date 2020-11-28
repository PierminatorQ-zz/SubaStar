module CartHelper


  def get_product(orderAuction)
    product = Product.find(orderAuction.product_id)
  end


  
  
end
