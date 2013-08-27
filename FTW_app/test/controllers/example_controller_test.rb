require 'test_helper'

class ExampleControllerTest < ActionController::TestCase
  test "should get random_number" do
    get :random_number
    assert_response :success
  end

  test "should get palindrome" do
    get :palindrome
    assert_response :success
  end

  test "should get anagram" do
    get :anagram
    assert_response :success
  end

end
