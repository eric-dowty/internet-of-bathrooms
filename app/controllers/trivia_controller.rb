class TriviaController < ApplicationController
  respond_to :json
  before_action :authorize!, only: [:trivia]

  def data
    trivia = TriviaService.new.get_question 
    Trivia.create(user_id: current_user.id, answer: trivia[:answer], value: trivia[:value])
    respond_with trivia
  end

end