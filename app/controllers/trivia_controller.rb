class TriviaController < ApplicationController

  before_action :authorize!, only: [:trivia]

  def data
    respond_with TriviaService.new.get_question 
  end

end