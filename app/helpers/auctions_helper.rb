module AuctionsHelper

  def last_bid auction
    bid_last= Bid.where(auction_id: auction.id).last
    bid_last.amount
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



  def winner auction
    winner = Bid.where(auction_id: auction.id).last
    winner.user.name
  end
  
end
