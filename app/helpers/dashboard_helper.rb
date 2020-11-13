module DashboardHelper

  def dinero_pujado(user)
    money=user.bids.pluck(:amount).sum
  end

  def pujas_ganadas(user)
    win=Bid.where(user_id: user.id).last.auction.title
  end
end
