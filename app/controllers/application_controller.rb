class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Restrict all pages only to authenticated users
  before_action :authenticate_user!
end
