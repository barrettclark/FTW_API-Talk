require 'rubygems'
require 'json'
require 'bundler'
require 'test/unit'
require 'webmock/test_unit'
require 'addressable/uri'

Bundler.require

# thank you octokit
def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def json_from_fixture(file)
  json = fixture(file).read
  JSON.parse(json)
end

def json_response(file)
  {
    :body => fixture(file),
    :headers => {
      :content_type => 'application/json; charset=utf-8'
    }
  }
end
