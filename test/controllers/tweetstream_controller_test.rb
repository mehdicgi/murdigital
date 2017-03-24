require 'test_helper'

class TweetstreamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweetstream_index_url
    assert_response :success
  end

  test "should get start" do
    get tweetstream_start_url
    assert_response :success
  end

  test "should get stop" do
    get tweetstream_stop_url
    assert_response :success
  end

  test "should get restart" do
    get tweetstream_restart_url
    assert_response :success
  end

end
