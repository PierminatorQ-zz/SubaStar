class WinnerMailer < ApplicationMailer
  def winner_send(user,subasta)
    @user=user
    @auction_name=subasta
    mail to: user.email, subject: "Eres el Ganador", from: "administrator@subastar.com"
    
  end
  
end
