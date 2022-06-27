require "test_helper"

class ProjectLeadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_lead_index_url
    assert_response :success
  end
end
