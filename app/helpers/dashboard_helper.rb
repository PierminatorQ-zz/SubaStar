module DashboardHelper

  def dinero_pujado(user)
    money=user.bids.pluck(:amount).sum
  end

  def pujas_ganadas(user)
    win=Auction.where(winner_id: user.id).count
  end

  def find_auction(id)
    auction=Auction.find(id)
  end

  def winner(auction)
    winner=""
    if auction.winner_id.present?
    userId= auction.winner_id
    user = User.find(userId)
    winner=user.name
    
    else
      winner="desierta"
    end
    winner
  end
  
end
