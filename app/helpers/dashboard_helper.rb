module DashboardHelper

  # @crew_list = Employee.where(role: "Carpenter").where(crew_id: 1).map { |employee|
  #   employee.name }

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

  def division_workload
    @division_count = Division.all.count
    @division_array = []
    i = 0
    while i < @division_count do
      #todo fix and make dynamic rendering of divisions and division names
      @division = Division.all[i]
      @employee = Employee.all[i]
      value = Job.where(division: @division.name).sum(:three_month_hours) / Employee.where(division: @division.name).sum(:man_hours_three_months)
      if @division.utilization === 1
        i += 1
      elsif value <= 0 or value == Float::INFINITY or value == Float::NAN
        value = 0.0
        @division_array.push([name: @division.name, sum: value])
        i += 1
      else
        @division_array.push([name: @division.name, sum: value])
        i += 1
      end
    end
    return @division_array
  end

  def division_names

  end

end