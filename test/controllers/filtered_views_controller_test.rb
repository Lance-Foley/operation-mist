require "test_helper"

class FilteredViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get jobs" do
    get filtered_views_jobs_url
    assert_response :success
  end

  test "should get projects" do
    get filtered_views_projects_url
    assert_response :success
  end
end
