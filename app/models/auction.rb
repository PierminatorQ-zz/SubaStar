class Auction < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :bids, dependent: :delete_all
  has_many :order_auctions
  has_many :orders, through: :order_auctions
  validates :product_id, presence: true
  validates :initial_price, presence: true
  
  #votable feature
  acts_as_votable
  
  #create states machines
  include AASM

  aasm column: 'status' do
    state :inactive
    state :active, initial: true
    state :completed
    state :deserted


    event :publish do
      transitions from: :inactive, to: :active
    end

    event :unpublish do
      transitions from: :active, to: :inactive
    end

    event :won do
      transitions from: :active, to: :completed
    end

    event :abandon do
      transitions from: :active, to: :deserted
    end


  end

  #scope show only actives
  #scope :only_active, ->(auction) { where(status: "active")}
  #scope :auction_by, ->(user) { where(user_id: user.id)}



end
