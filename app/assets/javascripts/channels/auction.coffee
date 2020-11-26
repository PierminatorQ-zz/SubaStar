App.auction = App.cable.subscriptions.create "AuctionChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    
    $("#biddes").html data['bid']
    $('.contador').html data['timer']
    $('.timer').startTimer();
    
    # Called when there's incoming data on the websocket for this channel

  bidding:(bid, auction_id) ->
    @perform 'bidding', {bid: bid, auction_id: auction_id}


$(document).on 'keypress', '[data-behavior~=auction_speaker]', (event) ->
  
  if event.keyCode is 13
    auction_id=this.attributes["data-auction"].value
    App.auction.bidding event.target.value, auction_id
    event.target.value = ''
    event.preventDefault()
   