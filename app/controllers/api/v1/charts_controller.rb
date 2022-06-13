class Api::V1::ChartsController < ApplicationController
  def index
    @crews = Crew.all
    render json: @crews
  end

  def show
  end
end
