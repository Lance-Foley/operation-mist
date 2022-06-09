require "test_helper"

class VariancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variance = variances(:one)
  end

  test "should get index" do
    get variances_url
    assert_response :success
  end

  test "should get new" do
    get new_variance_url
    assert_response :success
  end

  test "should create variance" do
    assert_difference("Variance.count") do
      post variances_url, params: { variance: { variance: @variance.variance } }
    end

    assert_redirected_to variance_url(Variance.last)
  end

  test "should show variance" do
    get variance_url(@variance)
    assert_response :success
  end

  test "should get edit" do
    get edit_variance_url(@variance)
    assert_response :success
  end

  test "should update variance" do
    patch variance_url(@variance), params: { variance: { variance: @variance.variance } }
    assert_redirected_to variance_url(@variance)
  end

  test "should destroy variance" do
    assert_difference("Variance.count", -1) do
      delete variance_url(@variance)
    end

    assert_redirected_to variances_url
  end
end
