class UsersController < ApplicationController
  
  def _navigation
    @username = current_user.username
  end
  
end
