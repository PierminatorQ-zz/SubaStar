class BidBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(bid)
    ActionCable.server.broadcast 'auction_channel', bid: render_bid(bid)
  end

  private

  def render_bid(bid)
    ApplicationController.renderer.render(partial: 'bids/bid', locals: {bid: bid})
  end
end
