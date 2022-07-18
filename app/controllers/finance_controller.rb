class FinanceController < ApplicationController

  def index
    @projects = Project.all
  end

end
