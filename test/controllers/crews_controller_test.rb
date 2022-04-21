require "test_helper"

class CrewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crew = crews(:one)
  end

  test "should get index" do
    get crews_url
    assert_response :success
  end

  test "should get new" do
    get new_crew_url
    assert_response :success
  end

  test "should create crew" do
    assert_difference("Crew.count") do
      post crews_url, params: { crew: { available_hours_nine_months: @crew.available_hours_nine_months, available_hours_per_month: @crew.available_hours_per_month, available_hours_per_week: @crew.available_hours_per_week, available_hours_six_months: @crew.available_hours_six_months, available_hours_three_months: @crew.available_hours_three_months, available_hours_twelve_months: @crew.available_hours_twelve_months, contracted_hours_nine_months: @crew.contracted_hours_nine_months, contracted_hours_per_month: @crew.contracted_hours_per_month, contracted_hours_per_week: @crew.contracted_hours_per_week, contracted_hours_six_months: @crew.contracted_hours_six_months, contracted_hours_three_months: @crew.contracted_hours_three_months, contracted_hours_twelve_months: @crew.contracted_hours_twelve_months, name: @crew.name } }
    end

    assert_redirected_to crew_url(Crew.last)
  end

  test "should show crew" do
    get crew_url(@crew)
    assert_response :success
  end

  test "should get edit" do
    get edit_crew_url(@crew)
    assert_response :success
  end

  test "should update crew" do
    patch crew_url(@crew), params: { crew: { available_hours_nine_months: @crew.available_hours_nine_months, available_hours_per_month: @crew.available_hours_per_month, available_hours_per_week: @crew.available_hours_per_week, available_hours_six_months: @crew.available_hours_six_months, available_hours_three_months: @crew.available_hours_three_months, available_hours_twelve_months: @crew.available_hours_twelve_months, contracted_hours_nine_months: @crew.contracted_hours_nine_months, contracted_hours_per_month: @crew.contracted_hours_per_month, contracted_hours_per_week: @crew.contracted_hours_per_week, contracted_hours_six_months: @crew.contracted_hours_six_months, contracted_hours_three_months: @crew.contracted_hours_three_months, contracted_hours_twelve_months: @crew.contracted_hours_twelve_months, name: @crew.name } }
    assert_redirected_to crew_url(@crew)
  end

  test "should destroy crew" do
    assert_difference("Crew.count", -1) do
      delete crew_url(@crew)
    end

    assert_redirected_to crews_url
  end
end
