class Auction < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :bids

  #create states machines
  include AASM

  aasm column: 'state' do
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





end
