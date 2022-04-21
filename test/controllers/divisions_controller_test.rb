require "test_helper"

class DivisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @division = divisions(:one)
  end

  test "should get index" do
    get divisions_url
    assert_response :success
  end

  test "should get new" do
    get new_division_url
    assert_response :success
  end

  test "should create division" do
    assert_difference("Division.count") do
      post divisions_url, params: { division: { hours_per_month: @division.hours_per_month, hours_per_week: @division.hours_per_week, name: @division.name, nine_month_hours: @division.nine_month_hours, six_month_hours: @division.six_month_hours, three_month_hours: @division.three_month_hours, twelve_month_hours: @division.twelve_month_hours } }
    end

    assert_redirected_to division_url(Division.last)
  end

  test "should show division" do
    get division_url(@division)
    assert_response :success
  end

  test "should get edit" do
    get edit_division_url(@division)
    assert_response :success
  end

  test "should update division" do
    patch division_url(@division), params: { division: { hours_per_month: @division.hours_per_month, hours_per_week: @division.hours_per_week, name: @division.name, nine_month_hours: @division.nine_month_hours, six_month_hours: @division.six_month_hours, three_month_hours: @division.three_month_hours, twelve_month_hours: @division.twelve_month_hours } }
    assert_redirected_to division_url(@division)
  end

  test "should destroy division" do
    assert_difference("Division.count", -1) do
      delete division_url(@division)
    end

    assert_redirected_to divisions_url
  end
end
