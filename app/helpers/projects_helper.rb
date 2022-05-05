module ProjectsHelper

  def total_contract_amount
    Job.where(project_id: @project.id).sum(:total_cost)
  end

  def total_hours_per_week
    Job.where(project_id: @project.id).sum(:hours_per_week)
  end

  def total_bid_hours
    Job.where(project_id: @project.id).sum(:man_hours)
  end

  def total_weeks_remaining
    Job.where(project_id: @project.id).sum(:week_remaining)
  end

  def e_rating
    Job.where(project_id: @project.id).average(:e_rating)
  end

  def three_month_hours
    Job.where(project_id: @project.id).sum(:three_month_hours)
  end

  def total_hours_worked
    Job.where(project_id: @project.id).sum(:actual_worked_hours)
  end

  def total_hours_remaining
    Job.where(project_id: @project.id).sum(:hours_remaining)
  end

end
