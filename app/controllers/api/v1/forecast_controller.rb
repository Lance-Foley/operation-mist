class Api::V1::ForecastController < ApplicationController
  def index
    @projects = Project.all
    render json: @projects

  end

  def show
  end

end
