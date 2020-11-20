class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :auctions, dependent: :destroy
  has_one_attached :image
end
