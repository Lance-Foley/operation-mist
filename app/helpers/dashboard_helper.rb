module DashboardHelper

  # @crew_list = Employee.where(role: "Carpenter").where(crew_id: 1).map { |employee|
  #   employee.name }

  def crew_week_workload(crew)
    @crew_workload = Job.where(crew_id: crew).where("start_date < ?", Date.today).sum(:hours_per_week) /
      Employee.where(crew_id: crew).sum(:true_man_hours_per_week)
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

      @division = Division.all[i]
      @employee = Employee.all[i]
      value = Job.where(division: @division.name).sum(:three_month_hours) / Employee.where(division: @division.name).sum(:man_hours_three_months)
      if @division.utilization == 1 or @division.utilization == "nonbillable"
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

  def division_e_rating
    @division_count = Division.all.count
    @division_array = []
    i = 0
    while i < @division_count do
      @division = Division.all[i]
      value = Job.where(division: @division.name, completed: true).average(:e_rating).to_f.round(2)
      if @division.utilization == 1 or @division.utilization == "nonbillable"
        i += 1
      elsif value == 0 or value == Float::INFINITY or value == Float::NAN
        value = 0
        @division_array.push([name: @division.name, average: value])
        i += 1
      else
        @division_array.push([name: @division.name, average: value])
        i += 1
      end
    end
    return @division_array
  end

  def render_billable_division
    @division_count = Division.all.count
    @division_array = []
    i = 0
    while i < @division_count do
      @division = Division.all[i]
      @crew = Crew.all[i]

      if @division.utilization == 1 or @division.utilization == "nonbillable"
        i += 1
      else
        @division_array.push(@division.name)
        i += 1
      end
    end
    return @division_array.sort
  end

  def render_crew_per_division
    @crew_count = Crew.all.count
    @crew_array = []
    i = 0
    while i < @crew_count do
      @division = Division.where(crew_id: Crew.find_by_name(i).name)
      @crew = Crew.all[i]

    end
  end

end