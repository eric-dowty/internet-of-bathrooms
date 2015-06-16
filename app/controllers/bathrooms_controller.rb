class BathroomsController < ApplicationController
  respond_to :json, :html
  before_action :authorize!, only: [:main]

  def main
    @toilet_status = ToiletService.new.usage_data
    respond_with @toilet_status
  end

  def home
  end

end