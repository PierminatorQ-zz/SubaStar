App.auction = App.cable.subscriptions.create "AuctionChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#bids").html data['bid']
    # Called when there's incoming data on the websocket for this channel

  bidding:(bid) ->
    @perform 'bidding', bid: bid

$(document).on 'keypress', '[data-behavior~=auction_speaker]', (event) ->
  
  if event.keyCode is 13
    App.auction.bidding event.target.value
    event.target.value = ''
    event.preventDefault()


    ### $(document).on 'keypress', '[data-behavior~=auction_speaker]', (event) ->
  
  if event.keyCode is 13
    App.auction.bidding event.target.value
    event.target.value = ''
    event.preventDefault() ###