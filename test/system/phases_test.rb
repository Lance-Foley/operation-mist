require "application_system_test_case"

class PhasesTest < ApplicationSystemTestCase
  setup do
    @phase = phases(:one)
  end

  test "visiting the index" do
    visit phases_url
    assert_selector "h1", text: "Phases"
  end

  test "should create phase" do
    visit phases_url
    click_on "New phase"

    fill_in "Hours per month", with: @phase.hours_per_month
    fill_in "Hours per week", with: @phase.hours_per_week
    fill_in "Name", with: @phase.name
    fill_in "Nine month hours", with: @phase.nine_month_hours
    fill_in "Six month hours", with: @phase.six_month_hours
    fill_in "Three month hours", with: @phase.three_month_hours
    fill_in "Twelve month hours", with: @phase.twelve_month_hours
    click_on "Create Phase"

    assert_text "Phase was successfully created"
    click_on "Back"
  end

  test "should update Phase" do
    visit phase_url(@phase)
    click_on "Edit this phase", match: :first

    fill_in "Hours per month", with: @phase.hours_per_month
    fill_in "Hours per week", with: @phase.hours_per_week
    fill_in "Name", with: @phase.name
    fill_in "Nine month hours", with: @phase.nine_month_hours
    fill_in "Six month hours", with: @phase.six_month_hours
    fill_in "Three month hours", with: @phase.three_month_hours
    fill_in "Twelve month hours", with: @phase.twelve_month_hours
    click_on "Update Phase"

    assert_text "Phase was successfully updated"
    click_on "Back"
  end

  test "should destroy Phase" do
    visit phase_url(@phase)
    click_on "Destroy this phase", match: :first

    assert_text "Phase was successfully destroyed"
  end
end
