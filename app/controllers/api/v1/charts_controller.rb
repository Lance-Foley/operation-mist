class Api::V1::ChartsController < ApplicationController
  def index
    @crews = Job.all
    render json: @crews
  end

  def show
  end
end
