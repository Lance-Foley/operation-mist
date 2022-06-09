require "application_system_test_case"

class VariancesTest < ApplicationSystemTestCase
  setup do
    @variance = variances(:one)
  end

  test "visiting the index" do
    visit variances_url
    assert_selector "h1", text: "Variances"
  end

  test "should create variance" do
    visit variances_url
    click_on "New variance"

    fill_in "Variance", with: @variance.variance
    click_on "Create Variance"

    assert_text "Variance was successfully created"
    click_on "Back"
  end

  test "should update Variance" do
    visit variance_url(@variance)
    click_on "Edit this variance", match: :first

    fill_in "Variance", with: @variance.variance
    click_on "Update Variance"

    assert_text "Variance was successfully updated"
    click_on "Back"
  end

  test "should destroy Variance" do
    visit variance_url(@variance)
    click_on "Destroy this variance", match: :first

    assert_text "Variance was successfully destroyed"
  end
end
