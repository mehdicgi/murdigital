class AddChannelsMessagesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :channels_messages, id: false do |t|
      t.belongs_to :channel, index: true
      t.belongs_to :message, index: true
    end
  end
end
