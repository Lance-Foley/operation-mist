require "test_helper"

class FinanceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get finance_index_url
    assert_response :success
  end
end
