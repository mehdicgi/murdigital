class TweetstreamController < ApplicationController
  def index
    @twitter_accounts = Property.find_by(name: 'TWITTER_ACCOUNT').value.split(',')
    @args=[]
    cmd = `ps -aux | grep 'tweetstream.rb' | grep -v grep`
    if cmd.eql? ""
      @process_status = 0
    else
      @process_status = 1
      @process_id = cmd.split(' ')[1]
      ar = cmd.split(' ')
      @args = ar[ar.find_index('ruby')+2..-1]
    end
  end

  def start
    twitter_accounts = Property.find_by(name: 'TWITTER_ACCOUNT').value.split(',')
    script_path = Rails.root.join('lib','tweetstream.rb').to_s
    puts script_path
    launcher = spawn("ruby #{script_path} #{twitter_accounts.join(' ')}")
    redirect_to tweetstream_index_url
  end

  def stop
    cmd = `ps -aux | grep 'tweetstream.rb' | grep -v grep`
    unless cmd.eql? ""
      process_id = cmd.split(' ')[1]
      kill = `kill -9 #{process_id}`
    end
    redirect_to tweetstream_index_url
  end

  def restart
    redirect_to tweetstream_index_url
  end
end
