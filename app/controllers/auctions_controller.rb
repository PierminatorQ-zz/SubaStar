class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  after_action :blank_auction, only: [:index]
  before_action :winner_auction, only: [:index, :show]

  # GET /auctions
  # GET /auctions.json
  def index
    @auctions = Auction.only_active(@auction).auction_by(current_user)
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
    
    @countdown_seconds = timediff(DateTime.now.in_time_zone, @auction.end_date, 1.second)
    @bid= Bid.where(auction_id: @auction.id).last
    
  
  end


  # GET /auctions/new
  def new
    @auction = Auction.new
    @products = Product.where(user_id: current_user)
  end

  def timediff(x,y,method)
    ((y - x)/ method).to_i
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

    def blank_auction
      @auctions.each do |f|
        if f.end_date < DateTime.now.in_time_zone
          f.unpublish! 
        end
      end
    end
  
    

    def winner_auction
      
      if @countdown_seconds == 0 
        if @last_bid.present?
        @auction.winner_id = @last_bid.user_id
        @auction.won
        @auction.save
        redirect_to @auction
        else
        @auction.unpublish
        @auction.save
        redirect_to root_path
        end
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
