require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference("Job.count") do
      post jobs_url, params: { job: { crew: @job.crew, division: @job.division, end_date: @job.end_date, hours_per_week: @job.hours_per_week, hours_remaining: @job.hours_remaining, man_hours: @job.man_hours, name: @job.name, nine_month_hours: @job.nine_month_hours, phase: @job.phase, six_month_hours: @job.six_month_hours, start_date: @job.start_date, sub_cost: @job.sub_cost, three_month_hours: @job.three_month_hours, total_cost: @job.total_cost, twelve_month_hours: @job.twelve_month_hours, week_remaining: @job.week_remaining, weeks: @job.weeks } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { crew: @job.crew, division: @job.division, end_date: @job.end_date, hours_per_week: @job.hours_per_week, hours_remaining: @job.hours_remaining, man_hours: @job.man_hours, name: @job.name, nine_month_hours: @job.nine_month_hours, phase: @job.phase, six_month_hours: @job.six_month_hours, start_date: @job.start_date, sub_cost: @job.sub_cost, three_month_hours: @job.three_month_hours, total_cost: @job.total_cost, twelve_month_hours: @job.twelve_month_hours, week_remaining: @job.week_remaining, weeks: @job.weeks } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference("Job.count", -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
