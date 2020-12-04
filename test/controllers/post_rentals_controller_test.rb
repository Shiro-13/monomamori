require 'test_helper'

class PostRentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_rentals_index_url
    assert_response :success
  end

  test "should get create" do
    get post_rentals_create_url
    assert_response :success
  end

  test "should get update" do
    get post_rentals_update_url
    assert_response :success
  end

end
