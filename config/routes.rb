Rails.application.routes.draw do
  # Chatrooms controller
  resources :chat_rooms, only: [:new, :create, :show, :index]

  # Action cable
  mount ActionCable.server => '/cable'

  # Default route
  root 'chat_rooms#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
