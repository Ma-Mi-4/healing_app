require "test_helper"

class PeriodControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get period_index_url
    assert_response :success
  end
end
