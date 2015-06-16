class BathroomsController < ApplicationController

  before_action :authorize!, only: [:main]

  def main
  end

  def home
  end

end