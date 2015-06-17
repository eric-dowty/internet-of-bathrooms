class TriviaController < ApplicationController
  respond_to :json
  before_action :authorize!, only: [:trivia]

  def data
    trivia = TriviaService.new.get_question 
    Trivia.update_question(current_user.id, trivia[:answer], trivia[:value])
    respond_with trivia
  end

end