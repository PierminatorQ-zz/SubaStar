class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  before_action :check_disabled_auction, only: [:index, :show]
  before_action :winner_auction, only: [:index, :show]

  # GET /auctions
  # GET /auctions.json
  def index
    @auctions = Auction.all
    
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
    @last_bid= Bid.where(auction_id: @auction.id).last
    @bid=@last_bid
    @countdown_seconds = timediff(DateTime.now.in_time_zone, @auction.end_date, 1.second)
  end


   

  # GET /auctions/new
  def new
    @auction = Auction.new
    @products = Product.where(user_id: current_user)
  end

  def timediff(x,y,method)
    ((x - y)/ method).abs.to_i
  end

  # GET /auctions/1/edit
  def edit
  end

  # POST /auctions
  # POST /auctions.json
  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    respond_to do |format|
      if @auction.save
        format.html { redirect_to @auction, notice: 'Auction was successfully created.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, notice: 'Auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, notice: 'Auction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def check_disabled_auction
      if @countdown_seconds == 0 && @last_bid.nil?
        @auction.unpublish
      end
    end

    def winner_auction
      if @countdown_seconds == 0 && @last_bid.present?
        
        @auction.won
      end
    end
    
    

    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auction_params
      params.require(:auction).permit(:title, :description, :status, :initial_price, :start_date, :end_date, :user_id, :product_id)
    end
end
