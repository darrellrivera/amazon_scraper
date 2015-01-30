require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test "#index should return success" do
    get :index
    assert_response :success
  end

  test "#new should return success" do
    get :new
    assert_response :success
  end
end
