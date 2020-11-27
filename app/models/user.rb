class User < ApplicationRecord
  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

         has_many :products, dependent: :destroy
         has_many :auctions, dependent: :destroy
         has_many :bids, dependent: :destroy
         
         acts_as_voter
        
         

         def self.from_omniauth(auth)
           where(email: auth.info.email).first_or_create do |user|
             user.email = auth.info.email
             user.password = Devise.friendly_token[0,10]
           end
         end

  
end
