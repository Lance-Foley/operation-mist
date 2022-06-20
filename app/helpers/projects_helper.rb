module ProjectsHelper

  def get_project_manger_phone_number
    @phone_number = Employee.where(name: @project.project_manager)
    if @phone_number.count <= 0
      "No Number"
    else
      @phone_number.first.phone_number
    end
  end

  def get_project_manger_email
    @phone_number = Employee.where(name: @project.project_manager)
    if @phone_number.count <= 0
      "No Number"
    else
      @phone_number.first.email
    end
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

  def cost_per_day
    @job = Job.all

    @job.each do |job|
      (job.start_date.to_datetime.to_i).step(1.day) do |day|
        day = job.cost_per_day
        puts day
      end
    end

  end

end
