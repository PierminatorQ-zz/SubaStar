module HomeHelper


  def last_bid auction
    @last_bid =Bid.where(auction_id: auction.id).last
    @last_bid.amount
  end

end
