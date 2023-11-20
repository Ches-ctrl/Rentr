require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cars_new_url
    assert_response :success
  end

  test "should get create" do
    get cars_create_url
    assert_response :success
  end
end
