require File.expand_path("../test_helper", __FILE__)

class RandomNumberTest < Test::Unit::TestCase
  def test_random_number
    stub_request(:get, "#{Ftwapi::Base::URI}/random_number").
      to_return(json_response('random_number.json'))
    response = RandomNumber.random_number
    assert_equal 58, response['number']
  end

  def test_rate_limited
    stub_request(:get, "#{Ftwapi::Base::URI}/random_number").
      to_return(status: 429, :body => '{"error":"Whoops", "success":false}')
    assert_raise Ftwapi::RateLimited do
      response = RandomNumber.random_number
    end
  end
end
