require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "should create job" do
    visit jobs_url
    click_on "New job"

    fill_in "Crew", with: @job.crew
    fill_in "Division", with: @job.division
    fill_in "End date", with: @job.end_date
    fill_in "Hours per week", with: @job.hours_per_week
    fill_in "Hours remaining", with: @job.hours_remaining
    fill_in "Man hours", with: @job.man_hours
    fill_in "Name", with: @job.name
    fill_in "Nine month hours", with: @job.nine_month_hours
    fill_in "Phase", with: @job.phase
    fill_in "Six month hours", with: @job.six_month_hours
    fill_in "Start date", with: @job.start_date
    fill_in "Sub cost", with: @job.sub_cost
    fill_in "Three month hours", with: @job.three_month_hours
    fill_in "Total cost", with: @job.total_cost
    fill_in "Twelve month hours", with: @job.twelve_month_hours
    fill_in "Week remaining", with: @job.week_remaining
    fill_in "Weeks", with: @job.weeks
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "should update Job" do
    visit job_url(@job)
    click_on "Edit this job", match: :first

    fill_in "Crew", with: @job.crew
    fill_in "Division", with: @job.division
    fill_in "End date", with: @job.end_date
    fill_in "Hours per week", with: @job.hours_per_week
    fill_in "Hours remaining", with: @job.hours_remaining
    fill_in "Man hours", with: @job.man_hours
    fill_in "Name", with: @job.name
    fill_in "Nine month hours", with: @job.nine_month_hours
    fill_in "Phase", with: @job.phase
    fill_in "Six month hours", with: @job.six_month_hours
    fill_in "Start date", with: @job.start_date
    fill_in "Sub cost", with: @job.sub_cost
    fill_in "Three month hours", with: @job.three_month_hours
    fill_in "Total cost", with: @job.total_cost
    fill_in "Twelve month hours", with: @job.twelve_month_hours
    fill_in "Week remaining", with: @job.week_remaining
    fill_in "Weeks", with: @job.weeks
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "should destroy Job" do
    visit job_url(@job)
    click_on "Destroy this job", match: :first

    assert_text "Job was successfully destroyed"
  end
end
