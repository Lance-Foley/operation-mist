class FilteredViewsController < ApplicationController
  def jobs
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)
  end

  def projects
  end
end
