class AuctionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auction, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :toggle_status]
  before_action :blank_auction, only: [:index, :show]

 
  
  

  # GET /auctions
  # GET /auctions.json
  def index
    if( params[:search] && !params[:search].empty? )
      @auctions = Auction.where("title LIKE ?", "%#{params[:search]}%").order(created_at: :desc)  
    else
      if current_user.admin?
        @auctions=Auction.all.order(created_at: :desc)
      else
        @auctions = Auction.filtered_by_user(current_user).order(created_at: :desc)
      end
    end
    @page_title= 'Mis Subastas'
  end

  

  # GET /auctions/1
  # GET /auctions/1.json
  def show

    @auctions=Auction.joins(:product).where(products: {category_id:@auction.product.category_id}).only_active(@auction).uniq
    @countdown_seconds = timediff(DateTime.now.in_time_zone, @auction.end_date.in_time_zone, 1.second)
    @bid_last= Bid.where(auction_id: @auction.id).last
    @bid=@bid_last
    
    @page_title= @auction.title
  end

  #uplike from user
  def upvote
      @auction.upvote_from current_user
      redirect_to root_path
  end
    
  #downlike form user
  def downvote
    @auction.downvote_from current_user
      redirect_to root_path
  end
  
  def toggle_status
    if @auction.active?
      @auction.unpublish!
    else
      @auction.publish!
    end
    redirect_to auctions_url, notice: 'El Estado ha sido actualizado.'
  end

  # GET /auctions/new
  def new
    @page_title= 'Crea tu Subasta'
    @auction = Auction.new
    @products = Product.where(user_id: current_user)
    @product=Product.new

  
    
  end

  def timediff(x,y,method)
    ((y - x)/ method).to_i
  end

  # GET /auctions/1/edit
  def edit
    @page_title= 'Edita tu subasta'
    @auction = Auction.find(params[:id])
    @products = Product.where(user_id: current_user)
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


        

    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auction_params
      params.require(:auction).permit(:title, :description, :status, :initial_price, :start_date, :end_date, :user_id, :product_id)
    end
end
