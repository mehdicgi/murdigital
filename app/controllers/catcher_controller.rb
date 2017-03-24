class CatcherController < ApplicationController

  def sms
    provider = Provider.find_by(name: 'SMS')
    @message = Message.create(
        content: params[:text],
        author: params[:phone],
        provider: provider
      )
  end

  def message
    provider = Provider.find_by(name: params[:source].upcase)
    @message = Message.create(
      content: params[:text],
      author: params[:author],
      provider: provider
    )
  end
end
