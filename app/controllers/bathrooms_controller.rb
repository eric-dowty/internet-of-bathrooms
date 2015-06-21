class BathroomsController < ApplicationController
  respond_to :json, :html
  before_action :authorize!, only: [:main]

  def home
  end

  def main
    @toilet_status = ToiletService.new.usage_data
  end

  def status
    respond_with Bathroom.status
  end

  def updates
    Bathroom.updates
    respond_with Bathroom.status
  end

end