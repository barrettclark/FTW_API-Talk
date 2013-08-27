require File.expand_path("../test_helper", __FILE__)

class PalindromeTest < Test::Unit::TestCase
  def test_palindrome_yes
    stub_request(:get, "#{Ftwapi::Base::URI}/palindrome/mom").
      to_return(json_response('palindrome_true.json'))
    palindrome = Palindrome.new('mom')
    response = palindrome.palindrome
    assert_equal true, response['is_palindrome']
  end

  def test_palindrome_yes_with_object
    stub_request(:get, "#{Ftwapi::Base::URI}/palindrome/mom").
      to_return(json_response('palindrome_true.json'))
    palindrome = Palindrome.new('mom')
    response = palindrome.palindrome(false)
    assert_equal true, palindrome.is_palindrome
  end

  def test_palindrome_no
    stub_request(:get, "#{Ftwapi::Base::URI}/palindrome/mommy").
      to_return(json_response('palindrome_false.json'))
    palindrome = Palindrome.new('mommy')
    response = palindrome.palindrome
    assert_equal false, response['is_palindrome']
  end
end
