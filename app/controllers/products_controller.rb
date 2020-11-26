class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /products
  # GET /products.json
  def index
    
    if current_user.admin?
      @products = Product.all
    else
    @products = Product.filtered_by_user(current_user)
    end
    @page_title= 'Mis Productos a Subastar'
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @page_title= @product.title
  end

  # GET /products/new
  def new
    @page_title= 'Crea tu Producto'
    @product = Product.new
    @categories = Category.all
  end

  # GET /products/1/edit
  def edit
    @page_title= 'Edita tu producto'
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    respond_to do |format|
      if @product.save
        format.js
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :index, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :author, :initial_price, :delivery_cost, :user_id, :image, :category_id)
    end
end
