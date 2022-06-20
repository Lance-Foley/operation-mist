class Api::V1::CostPerDayController < ApplicationController
  def index
    @project = Project.all
    render json: @project
  end

  def show
  end
end
