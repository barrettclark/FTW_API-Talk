require 'httparty'
require 'json'

module Ftwapi
  class Base
    include HTTParty
    URI = 'http://localhost:9292'
    base_uri URI

    def self.verify_response(data)
      # NOTE: should all of these raise or should some reissue the request?
      if Ftwapi::HTTP_ERROR_CODES[data.response.code.to_i]
	klass = Ftwapi::HTTP_ERROR_CODES[data.response.code.to_i]
	raise klass.new(data)
      else
	return
      end
    end
  end

  ##
  # Print out the error message returned from \Ftwapi
  class Error < StandardError
    attr_reader :data
    def initialize(data)
      err = JSON.parse(data)
      super(err['error'])
    end
  end

  class BadRequest < Error; end           # 400
  class Unauthorized < Error; end         # 401
  class Forbidden < Error; end            # 403
  class NotFound < Error; end             # 404
  class NotAcceptable < Error; end        # 406
  class RateLimited < Error; end          # 429
  class InternalServerError < Error; end  # 500
  class ServiceUnavailable < Error; end   # 503
  class GatewayTimeout < Error; end       # 504

  HTTP_ERROR_CODES = {
    400 => Ftwapi::BadRequest,
    401 => Ftwapi::Unauthorized,
    403 => Ftwapi::Forbidden,
    404 => Ftwapi::NotFound,
    406 => Ftwapi::NotAcceptable,
    429 => Ftwapi::RateLimited,
    500 => Ftwapi::InternalServerError,
    503 => Ftwapi::ServiceUnavailable,
    504 => Ftwapi::GatewayTimeout
  }
end

require File.expand_path("../ftwapi/anagram", __FILE__)
require File.expand_path("../ftwapi/palindrome", __FILE__)
require File.expand_path("../ftwapi/random_number", __FILE__)
require File.expand_path("../ftwapi/version", __FILE__)
