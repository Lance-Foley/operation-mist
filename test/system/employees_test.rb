require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "should create employee" do
    visit employees_url
    click_on "New employee"

    fill_in "Contr hour per month", with: @employee.contr_hour_per_month
    fill_in "Contr hours nine months", with: @employee.contr_hours_nine_months
    fill_in "Contr hours per week", with: @employee.contr_hours_per_week
    fill_in "Contr hours three months", with: @employee.contr_hours_three_months
    fill_in "Contr hours twelve months", with: @employee.contr_hours_twelve_months
    fill_in "Crew", with: @employee.crew
    fill_in "Division", with: @employee.division
    fill_in "Man hours nine months", with: @employee.man_hours_nine_months
    fill_in "Man hours per month", with: @employee.man_hours_per_month
    fill_in "Man hours per twelve months", with: @employee.man_hours_per_twelve_months
    fill_in "Man hours per week", with: @employee.man_hours_per_week
    fill_in "Man hours six months", with: @employee.man_hours_six_months
    fill_in "Man hours three months", with: @employee.man_hours_three_months
    fill_in "Name", with: @employee.name
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "should update Employee" do
    visit employee_url(@employee)
    click_on "Edit this employee", match: :first

    fill_in "Contr hour per month", with: @employee.contr_hour_per_month
    fill_in "Contr hours nine months", with: @employee.contr_hours_nine_months
    fill_in "Contr hours per week", with: @employee.contr_hours_per_week
    fill_in "Contr hours three months", with: @employee.contr_hours_three_months
    fill_in "Contr hours twelve months", with: @employee.contr_hours_twelve_months
    fill_in "Crew", with: @employee.crew
    fill_in "Division", with: @employee.division
    fill_in "Man hours nine months", with: @employee.man_hours_nine_months
    fill_in "Man hours per month", with: @employee.man_hours_per_month
    fill_in "Man hours per twelve months", with: @employee.man_hours_per_twelve_months
    fill_in "Man hours per week", with: @employee.man_hours_per_week
    fill_in "Man hours six months", with: @employee.man_hours_six_months
    fill_in "Man hours three months", with: @employee.man_hours_three_months
    fill_in "Name", with: @employee.name
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee" do
    visit employee_url(@employee)
    click_on "Destroy this employee", match: :first

    assert_text "Employee was successfully destroyed"
  end
end
