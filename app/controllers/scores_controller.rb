class ScoresController < ApplicationController
  respond_to :json

  def show 
    respond_with current_user.get_score
  end

  def boards
    respond_with Score.boards
  end

end