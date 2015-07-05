require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    #HTTP请求
    get :home
    #返回状态为成功
    assert_response :success
    #title标签的内容测试
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "帮助 | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "关于 | Ruby on Rails Tutorial Sample App"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "联系 | Ruby on Rails Tutorial Sample App"
  end

end
