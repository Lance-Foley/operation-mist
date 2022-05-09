class DashboardController < ApplicationController
  def index
    @Field_Months_Remaining = Job.where(crew: ["Field 1", "Field 2", "Field 3", "Field 4",]).sum(:twelve_month_hours) /
      Employee.where(crew: ["Field 1", "Field 2", "Field 3", "Field 4",]).sum(:man_hours_twelve_months)

    @Field_2_Months_Remaining = Job.where(crew: "Field 2").sum(:three_month_hours) / Employee.where(crew: "Field 2").sum(:man_hours_three_months)
    @Field_3_Months_Remaining = Job.where(crew: "Field 3").sum(:three_month_hours) / Employee.where(crew: "Field 3").sum(:man_hours_three_months)
    @Field_4_Months_Remaining = Job.where(crew: "Field 4").sum(:three_month_hours) / Employee.where(crew: "Field 4").sum(:man_hours_three_months)

    @weekly_hours = Job.all.where("start_date < ?", Date.today)
                       .where(crew: "Field 1")
                       .sum(:hours_per_week)
    @available_hours = Employee.where(crew: "Field 1").sum(:true_man_hours_per_week)

  end

  def crew_months_remaining(crew)
    months_remaining = Job.where(crew: crew).sum(:three_month_hours) / Employee.where(crew: crew).sum(:man_hours_three_months)
    if months_remaining < 0
      return "Empty"
    else
      return months_remaining
    end
  end

  helper_method :crew_months_remaining

  # Returns List of Employees Based on Role and Crew Selection
  def crew_list(role, crew)
    list_employees = Employee.where(role: role).where(crew: crew)
    name = []
    if list_employees.count <= 0
      "Empty"
    else
      list_employees.map { |employee|

        employee.name }

    end
  end

  helper_method :crew_list

  def division_e_rating(name)
    @e_rating = Job.all.where(completed: true, division: name)
    if @e_rating.count <= 0
      0
    else
      @e_rating.average(:e_rating)
    end
  end

  def crew_e_rating(name)
    @e_rating = Job.all.where(completed: true, crew: name)
    if @e_rating.count <= 0
      0
    else
      @e_rating.average(:e_rating)
    end
  end

  helper_method :division_e_rating
  helper_method :crew_e_rating

  def e_rating
    Job.all.where(completed: true).average(:e_rating)
  end

  helper_method :e_rating

  # Returns First Foreman in Crew
  def crew_foreman(crew)
    foreman = Employee.where(role: "Foreman").where(crew: crew)
    if foreman.count <= 0
      "No Foreman"
    else
      foreman[0].name
    end
  end

  helper_method :crew_foreman

  def week_workload
    render json: [{ name: "Assigned", data: Job.group(:crew).where(crew: "Field 1")
                                               .where("start_date < ?", Date.today)
                                               .sum(:hours_per_week) },
                  { name: "Available", data: Employee.group(:crew).where(crew: "Field 1").sum(:true_man_hours_per_week) }]
  end

  helper_method :week_workload

  # Chart for Field 1 Workload in 3 Months
  def field_one_workload
    render json: [{ name: "Assigned", data: Job.group(:crew).where(crew: "Field 1").sum(:three_month_hours) },
                  { name: "Available", data: Employee.group(:crew).where(crew: "Field 1").sum(:man_hours_three_months) },]
  end

  helper_method :field_one_workload

  # Chart for 3 Month Workload for all Field Crews
  def three_month_workload

    @crews = Crew.all.pluck(:name)

    render json: [{ name: "Assigned", data: Job.group(:crew).where(crew: @crews).sum(:three_month_hours) },
                  { name: "Available", data: Employee.group(:crew).where(crew: @crews).sum(:man_hours_three_months) },].chart_json

  end

end