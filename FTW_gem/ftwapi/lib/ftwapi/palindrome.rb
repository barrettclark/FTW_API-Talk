class Palindrome < Ftwapi::Base
  attr_reader :candidate
  attr_accessor :is_palindrome

  def initialize(candidate)
    @candidate = candidate
  end

  # instance method off an already created object
  def palindrome(raw = true)
    data = self.class.get("/palindrome/#{candidate}")
    Ftwapi::Base.verify_response(data)
    if raw
      data.parsed_response
    else
      @is_palindrome = data.parsed_response['is_palindrome']
      @is_palindrome
    end
  end
end
