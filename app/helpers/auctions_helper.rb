module AuctionsHelper

  


  def last_bid auction
    @bid_last= Bid.where(auction_id: auction.id).last
    @bid_last.amount
  end

  def placeholder_mas auction
    show_price= 0
    if @bid_last.nil?
      show_price= auction.initial_price + 50
    else
      show_price = @bid_last.amount + 50
    end
    show_price
  end

 

  def translate status
  traduccion= ""
    if status == "active"
      traduccion="activo"
    elsif status =="deserted"
      traduccion="desierta"
    elsif status == "completed"
      traduccion = "terminada"
    elsif status == "inactive"
      traduccion="inactiva"
    end
    traduccion
  end



  
  
end
