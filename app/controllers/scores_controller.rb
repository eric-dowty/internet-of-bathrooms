class ScoresController < ApplicationController
  respond_to :json
  before_action :authorize!, only: [:show]

  def show 
    respond_with current_user.get_score
  end

  def boards
    respond_with Score.boards
  end

end