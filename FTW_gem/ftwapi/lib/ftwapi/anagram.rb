class Anagram < Ftwapi::Base
  attr_reader :subject
  attr_accessor :candidates

  def initialize(subject)
    @subject = subject
    @candidates = []
  end

  # instance method off an already created object
  def anagram(candidate, raw = true)
    data = self.class.get("/anagram/#{subject}/#{candidate}")
    Ftwapi::Base.verify_response(data)
    if raw
      data.parsed_response
    else
      @candidates << data.parsed_response
    end
  end
end
