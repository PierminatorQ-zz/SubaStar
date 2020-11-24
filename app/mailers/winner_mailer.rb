class WinnerMailer < ApplicationMailer
  def winner_send(user,subasta)
    @user_email=user.email
    @auction_name=subasta
    mail to: @user_email, subject: "Eres el Ganador", from: "administrator@subastar.com"
    
  end
  
end
