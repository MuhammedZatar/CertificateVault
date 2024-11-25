class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home] # Allows unauthenticated users to access
  def home
  end
end
