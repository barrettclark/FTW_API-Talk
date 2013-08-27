require File.expand_path("../test_helper", __FILE__)

class AnagramTest < Test::Unit::TestCase
  def test_anagram_yes
    stub_request(:get, "#{Ftwapi::Base::URI}/anagram/master/maters").
      to_return(json_response('anagram_true.json'))
    anagram = Anagram.new('master')
    response = anagram.anagram('maters')
    assert_equal true, response['matches']
  end

  def test_anagram_yes_with_object
    stub_request(:get, "#{Ftwapi::Base::URI}/anagram/master/maters").
      to_return(json_response('anagram_true.json'))
    anagram = Anagram.new('master')
    response = anagram.anagram('maters', false)
    assert_equal 1, anagram.candidates.count
    assert_equal true, anagram.candidates.first['matches']
  end

  def test_anagram_no
    stub_request(:get, "#{Ftwapi::Base::URI}/anagram/floop/bling").
      to_return(json_response('anagram_false.json'))
    anagram = Anagram.new('floop')
    response = anagram.anagram('bling')
    assert_equal false, response['matches']
  end
end
