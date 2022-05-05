module DivisionsHelper

  def work_load
    @workload = Job.where(division: @name).sum(:three_month_hours) / Employee.where(division: @name).sum(:man_hours_three_months)
    if @workload < 0
      0.0
    else
      @workload
    end
  end
end
