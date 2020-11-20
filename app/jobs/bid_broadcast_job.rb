class BidBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(bid)
    
    ActionCable.server.broadcast 'auction_channel', bid: render_bid(bid)
    ActionCable.server.broadcast 'auction_channel', timer: render_timer(bid)
  end

  private

  def render_bid(bid)
    
    ApplicationController.renderer.render(partial: 'bids/bid', locals: {bid: bid})
    
  end

  def render_timer(bid)
    countdown_seconds= timediff(DateTime.now.in_time_zone, bid.auction.end_date.in_time_zone, 1.second)
    
    ApplicationController.renderer.render(partial: 'auctions/timer', locals: {countdown_seconds: countdown_seconds})
  end

  def timediff(x,y,method)
    ((y - x)/ method).to_i
  end
end
