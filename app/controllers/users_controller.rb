class UsersController < ApplicationController
  respond_to :json

  def get_bot_data
    respond_with User.get_bot_data(current_user)
  end

  def update_bot_data
    respond_with User.update_bot_data(current_user)
  end

end