class Api::V1::ChartsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
  end
end
