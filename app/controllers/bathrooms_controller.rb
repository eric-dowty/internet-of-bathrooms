class BathroomsController < ApplicationController
  respond_to :json, :html
  before_action :authorize!, only: [:main]

  def home
  end

  def main
    @toilet_status = Bathroom.status
  end

  def status
    respond_with Bathroom.status
  end

  def updates
    Bathroom.updates(params["status"]) if params['key'] == ENV['TOILET_STATUS_KEY'] 
    respond_with Bathroom.status
  end

end