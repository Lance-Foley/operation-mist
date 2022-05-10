module DashboardHelper

  @crew_list = Employee.where(role: "Carpenter").where(crew_id: 1).map { |employee|
    employee.name }

  def crew_week_workload(crew)
    @crew_workload = Job.where(crew_id: crew).where("start_date < ?", Date.today).sum(:hours_per_week) /
      Employee.where(crew_id: crew).sum(:true_man_hours_per_week) * 100
    if @crew_workload <= 0
      0.0
    else
      @crew_workload
    end
  end

  def three_month_workload(crews)
    @crew_workload_3_months = Job.where(crew_id: crews).sum(:three_month_hours) / Employee.where(crew_id: crews).sum(:man_hours_three_months) * 100
    if @crew_workload_3_months <= 0
      0.0
    else
      @crew_workload_3_months
    end

  end
end
