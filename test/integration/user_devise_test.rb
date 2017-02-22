require 'test_helper'

class UserDeviseTest < ActionDispatch::IntegrationTest
  test "user can see home page after login" do
    get user_session_path
    assert_equal 200, status
    @u_one = users(:u_one)
    post user_session_path, 'user[email]' => @u_one.email, 'user[password]' =>  @u_one.password
    follow_redirect!
    assert_equal 200, status
    assert_equal "/", path
  end

  test "user can not see home page without login" do
    get "/offers"
    assert_equal 302, status
    follow_redirect!
    assert_equal "/users/sign_in", path
    assert_equal 200, status
  end
end
