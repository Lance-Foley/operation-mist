class Api::V1::FinanceController < ApplicationController

  def index
    render json: Forecast.monthly_totals(2022)
  end

end