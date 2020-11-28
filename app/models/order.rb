class Order < ApplicationRecord
  before_create :generate_number
  validates :number, uniqueness: true
  belongs_to :user
  has_many :order_auctions
  has_many :auctions, through: :order_auctions

   #create states machines
   include AASM

   aasm column: 'status' do
     
     state :unpaid, initial: true
     state :paid
  
     event :payed do
       transitions from: :unpaid, to: :paid
     end
 
   end

  def generate_number
    self.number ||= loop do
      random = "SA#{Array.new(9){rand(9)}.join}"
      break random unless self.class.exists?(number: random)
    end
  end

  def add_item(auction, current_order_id)
    @price=Bid.where(auction_id: auction.id).last.amount
    @product = auction.product_id
    if @product
     OrderAuction.create(auction_id:auction.id, product_id: @product, price: @price, order_id:current_order_id)
     compute_total     
    end
    
  end

  def compute_total
    sum = 0
    order_auctions.each do |item|
      sum += item.price
    end
    update_attribute(:total, sum)
  end


end
