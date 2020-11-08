json.extract! auction, :id, :title, :description, :status, :initial_price, :start_date, :end_date, :user_id, :product_id, :created_at, :updated_at
json.url auction_url(auction, format: :json)
