class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :auctions, dependent: :delete_all
  has_one_attached :image
  validates :title, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
end
