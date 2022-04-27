class DashboardController < ApplicationController
  def index
    @Field_Months_Remaining = Job.where(crew: ["Field 1", "Field 2", "Field 3", "Field 4",]).sum(:twelve_month_hours) /
      Employee.where(crew: ["Field 1", "Field 2", "Field 3", "Field 4",]).sum(:man_hours_twelve_months)
    @Field_1_Months_Remaining = Job.where(crew: "Field 1").sum(:three_month_hours) / Employee.where(crew: "Field 1").sum(:man_hours_three_months)
    @Field_2_Months_Remaining = Job.where(crew: "Field 2").sum(:three_month_hours) / Employee.where(crew: "Field 2").sum(:man_hours_three_months)
    @Field_3_Months_Remaining = Job.where(crew: "Field 3").sum(:three_month_hours) / Employee.where(crew: "Field 3").sum(:man_hours_three_months)
    @Field_4_Months_Remaining = Job.where(crew: "Field 4").sum(:three_month_hours) / Employee.where(crew: "Field 4").sum(:man_hours_three_months)
  end

  def three_month_workload
    render json: [{ name: "Contracted Hours", data: Job.group(:crew).where(crew: ["Field 1", "Field 2", "Field 3", "Field 4"]).sum(:three_month_hours) },
                  { name: "Available Hours", data: Employee.group(:crew).where(crew: ["Field 1", "Field 2", "Field 3", "Field 4"]).sum(:man_hours_three_months) },]
  end

  def field_one_workload
    render json: [{ name: "Contracted Hours", data: Job.group(:crew).where(crew: "Field 1").sum(:three_month_hours) },
                  { name: "Available Hours", data: Employee.group(:crew).where(crew: "Field 1").sum(:man_hours_three_months) },]
  end

  def field_two_workload
    render json: [{ name: "Contracted Hours", data: Job.group(:crew).where(crew: "Field 2").sum(:three_month_hours) },
                  { name: "Available Hours", data: Employee.group(:crew).where(crew: "Field 2").sum(:man_hours_three_months) },]
  end
end
