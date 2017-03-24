class DisplayController < ApplicationController
  def index
    display_name = params[:display]
    channel_name = params[:channel]

    @display = Display.find_by(name: display_name)
    @channel = Channel.find_by(name: channel_name)

    @messages = @channel.messages.last(@display.show_limit).reverse
    
    render layout: "public"
  end
end
