class AuctionChannel < ApplicationCable::Channel
  def subscribed
     stream_from "auction_channel"
     
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def bidding(data)
    dateNow= Time.now - Auction.find(data['auction_id']).end_date
    if Bid.where(auction_id: data['auction_id']).last.present?

      if data['bid'].to_i < Bid.where(auction_id: data['auction_id']).last.amount
        puts "no se puede"
      else
        
        Bid.create! amount: data['bid'], auction_id: data['auction_id'], user_id: current_user.id
        flash.now[:notice] = "dale dale dale"
      end
    else
      flash[:alert]= "estamos guardando"
      Bid.create! amount: data['bid'], auction_id: data['auction_id'], user_id: current_user.id
      if  dateNow<= 30
        dateNow = dateNow + 30
      end
    end


  end
end
