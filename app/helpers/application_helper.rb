module ApplicationHelper


  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def winner(auction)
    
    if auction.winner_id.present?
    userId= auction.winner_id
    user = User.find(userId)
    winner=user.email.split('@')[0]
    
    else
      winner="desierta"
    end
    winner
  end
  

  

end
