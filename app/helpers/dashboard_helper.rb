module DashboardHelper

  @crew_list = Employee.where(role: "Carpenter").where(crew: "Field 1").map { |employee|
    employee.name }

end
