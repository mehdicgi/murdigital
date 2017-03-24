class Message < ApplicationRecord
  belongs_to :provider
  has_and_belongs_to_many :channels

  validates :content, presence: true

  before_save :remove_http

  after_create :add_channels_from_content
  # after_create_commit { ActionCable.server.broadcast 'rooms', message: render_message, id: self.id, channels: channel_names.join(',')}

  def crypted_from
    self.author[-4..1] = 'XXXX' if self.author
    return self.author
  end


  def channel_names
    list = []
    self.channels.each do |channel|
      list.push channel.name
    end
    return list.join(',')
  end

  protected

  def render_message
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: self })
  end

  def remove_http
    self.content = self.content.split(' ').map!{ |e| e.start_with?('http')? nil : e}.join(' ').strip
  end

  def add_channels_from_content
    channels = Channel.includes(:keywords)
    channels.each do |channel|
      puts "Test pour la chaine : #{channel.name}"
      channel.keywords.each do |keyword|
        puts keyword.word
        puts self.content
        if self.content.upcase.include? keyword.word.upcase
          channel.messages.push self
          ActionCable.server.broadcast 'rooms', message: render_message, id: self.id, channel: channel.name
          puts 'Channel trouvé avec le mot clé #{keyword.word}'
          break
        end
      end
    end

    if self.channels.size == 0
      channels.each do |channel|
        channel.messages.push self
        ActionCable.server.broadcast 'rooms', message: render_message, id: self.id, channel: channel.name
      end
    end

  end
end
