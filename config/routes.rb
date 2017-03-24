Rails.application.routes.draw do
  get 'tweetstream/index'

  get 'tweetstream/start'

  get 'tweetstream/stop'

  get 'tweetstream/restart'

  resources :messages
  devise_for :users
  resources :keywords
  resources :displays
  resources :channels
  resources :providers
  mount ActionCable.server => '/cable'
  resources :properties
  get 'catcher/message'
  get 'catcher/sms'
  get 'channels/:id/destroy_all' => 'channels#destroy_all'
  get 'display/:display/:channel' => 'display#index'
  root to: "channels#index"
end
