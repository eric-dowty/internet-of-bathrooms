class BathroomsController < ApplicationController
  respond_to :json, :html
  before_action :authorize!, only: [:main]

  def home
  end

  def main
    @toilet_status = ToiletService.new.usage_data
    @trivia        = TriviaService.new.get_question
  end

  def status
    respond_with ToiletService.new.usage_data
  end

end