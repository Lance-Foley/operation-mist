require "test_helper"

class PhasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phase = phases(:one)
  end

  test "should get index" do
    get phases_url
    assert_response :success
  end

  test "should get new" do
    get new_phase_url
    assert_response :success
  end

  test "should create phase" do
    assert_difference("Phase.count") do
      post phases_url, params: { phase: { hours_per_month: @phase.hours_per_month, hours_per_week: @phase.hours_per_week, name: @phase.name, nine_month_hours: @phase.nine_month_hours, six_month_hours: @phase.six_month_hours, three_month_hours: @phase.three_month_hours, twelve_month_hours: @phase.twelve_month_hours } }
    end

    assert_redirected_to phase_url(Phase.last)
  end

  test "should show phase" do
    get phase_url(@phase)
    assert_response :success
  end

  test "should get edit" do
    get edit_phase_url(@phase)
    assert_response :success
  end

  test "should update phase" do
    patch phase_url(@phase), params: { phase: { hours_per_month: @phase.hours_per_month, hours_per_week: @phase.hours_per_week, name: @phase.name, nine_month_hours: @phase.nine_month_hours, six_month_hours: @phase.six_month_hours, three_month_hours: @phase.three_month_hours, twelve_month_hours: @phase.twelve_month_hours } }
    assert_redirected_to phase_url(@phase)
  end

  test "should destroy phase" do
    assert_difference("Phase.count", -1) do
      delete phase_url(@phase)
    end

    assert_redirected_to phases_url
  end
end
