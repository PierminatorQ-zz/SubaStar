class HomeController < ApplicationController
  def index
    @auctions= Auction.only_active(@auction)
  end
end
