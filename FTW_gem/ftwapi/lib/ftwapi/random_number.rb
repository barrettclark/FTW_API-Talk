class RandomNumber < Ftwapi::Base
  attr_reader :number

  def initialize(number)
    @number = number
  end

  # class method that can create an object
  def self.random_number(raw = true)
    data = get("/random_number")
    Ftwapi::Base.verify_response(data)
    if raw
      data.parsed_response
    else
      RandomNumber.new(data.parsed_response["number"])
    end
  end
end
