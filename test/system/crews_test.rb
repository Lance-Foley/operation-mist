require "application_system_test_case"

class CrewsTest < ApplicationSystemTestCase
  setup do
    @crew = crews(:one)
  end

  test "visiting the index" do
    visit crews_url
    assert_selector "h1", text: "Crews"
  end

  test "should create crew" do
    visit crews_url
    click_on "New crew"

    fill_in "Available hours nine months", with: @crew.available_hours_nine_months
    fill_in "Available hours per month", with: @crew.available_hours_per_month
    fill_in "Available hours per week", with: @crew.available_hours_per_week
    fill_in "Available hours six months", with: @crew.available_hours_six_months
    fill_in "Available hours three months", with: @crew.available_hours_three_months
    fill_in "Available hours twelve months", with: @crew.available_hours_twelve_months
    fill_in "Contracted hours nine months", with: @crew.contracted_hours_nine_months
    fill_in "Contracted hours per month", with: @crew.contracted_hours_per_month
    fill_in "Contracted hours per week", with: @crew.contracted_hours_per_week
    fill_in "Contracted hours six months", with: @crew.contracted_hours_six_months
    fill_in "Contracted hours three months", with: @crew.contracted_hours_three_months
    fill_in "Contracted hours twelve months", with: @crew.contracted_hours_twelve_months
    fill_in "Name", with: @crew.name
    click_on "Create Crew"

    assert_text "Crew was successfully created"
    click_on "Back"
  end

  test "should update Crew" do
    visit crew_url(@crew)
    click_on "Edit this crew", match: :first

    fill_in "Available hours nine months", with: @crew.available_hours_nine_months
    fill_in "Available hours per month", with: @crew.available_hours_per_month
    fill_in "Available hours per week", with: @crew.available_hours_per_week
    fill_in "Available hours six months", with: @crew.available_hours_six_months
    fill_in "Available hours three months", with: @crew.available_hours_three_months
    fill_in "Available hours twelve months", with: @crew.available_hours_twelve_months
    fill_in "Contracted hours nine months", with: @crew.contracted_hours_nine_months
    fill_in "Contracted hours per month", with: @crew.contracted_hours_per_month
    fill_in "Contracted hours per week", with: @crew.contracted_hours_per_week
    fill_in "Contracted hours six months", with: @crew.contracted_hours_six_months
    fill_in "Contracted hours three months", with: @crew.contracted_hours_three_months
    fill_in "Contracted hours twelve months", with: @crew.contracted_hours_twelve_months
    fill_in "Name", with: @crew.name
    click_on "Update Crew"

    assert_text "Crew was successfully updated"
    click_on "Back"
  end

  test "should destroy Crew" do
    visit crew_url(@crew)
    click_on "Destroy this crew", match: :first

    assert_text "Crew was successfully destroyed"
  end
end
