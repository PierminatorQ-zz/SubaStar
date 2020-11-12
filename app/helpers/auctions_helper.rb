module AuctionsHelper



  def translate status
  traduccion= ""
    if status == "active"
      traduccion="activo"
    else
      traduccion="inactivo"
    end
  end
end
