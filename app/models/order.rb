class Order < ApplicationRecord
  before_create :generate_number
  validates :number, uniqueness: true
  belongs_to :user
  has_many :order_auctions
  has_many :auctions, through: :order_auctions



  def generate_number
    self.number ||= loop do
      random = "SA#{Array.new(9){rand(9)}.join}"
      break random unless self.class.exists?(number: random)
    end
  end




end
