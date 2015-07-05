require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "注册 | Ruby on Rails Tutorial Sample App"
  end

end
