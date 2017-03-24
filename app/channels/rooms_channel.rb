# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def notify(data)
    Message.create! content: data['message']
    # ActionCable.server.broadcast 'rooms', message: data['message']
  end
end
