class AuctionChannel < ApplicationCable::Channel
 

  def subscribed
    
     stream_from "auction_channel"
     
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def bidding(data)
    data['seconds']=1
    last_bid= Bid.where(auction_id: data['auction_id'])
    end_date_auction= Auction.find(data['auction_id'])
    dateNow= (end_date_auction.end_date - Time.now ).to_i
    
      if last_bid.count > 0 && (data['bid'].to_i < last_bid.last.amount)
        puts "no se puede"
      else
        Bid.create! amount: data['bid'], auction_id: data['auction_id'], user_id: current_user.id
        if  dateNow<= 30
          end_date_auction.end_date = end_date_auction.end_date + 30
          end_date_auction.save!
        end
      end
  end  
  
      
end
