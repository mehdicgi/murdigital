App.rooms = App.cable.subscriptions.create "RoomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    addCard(data['message'],data['channel'],data['id'])
  notify: (message) ->
    @perform 'notify', message: message
