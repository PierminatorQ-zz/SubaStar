class AuctionChannel < ApplicationCable::Channel
  def subscribed
     stream_from "auction_channel"
     
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def bidding(data)
    Bid.create! amount: data['bid'], auction_id: 3, user_id: current_user.id
    if @countdown_seconds <= 30
      @countdown_seconds = @countdown_seconds + 30
    end
  end
end
