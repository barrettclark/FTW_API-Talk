class SinatraAPI < Sinatra::Base
  before do
    content_type 'application/json'
  end

  get '/' do
    redirect to('/random_number')
  end

  # http://localhost:9292/random_number
  get '/random_number' do
    number = RandomNumber.new
    number.to_json
  end

  # http://localhost:9292/palindrome/mom
  # http://localhost:9292/palindrome/mommy
  get '/palindrome/:candidate' do
    palindrome = Palindrome.new(params[:candidate])
    { candidate: palindrome.candidate,
      is_palindrome: palindrome.is_palindrome?
    }.to_json
  end

  # http://localhost:9292/anagram/floop/bling
  # http://localhost:9292/anagram/master/stream
  get '/anagram/:subject/:candidate' do
    anagram = Anagram.new(params[:subject])
    { subject: params[:subject],
      candidate: params[:candidate],
      matches: anagram.match(params[:candidate])
    }.to_json
  end
end


class RandomNumber
  attr_reader :number
  def initialize
    @number = rand(100)
  end

  def to_json
    {number: @number}.to_json
  end
end

class Anagram
  def initialize(subject)
    @subject = subject.downcase
  end

  def match(candidate)
    anagram?(candidate.downcase)
  end

  private

  def anagram?(candidate)
    same_letters?(candidate) && different_word?(candidate)
  end

  def different_word?(candidate)
    candidate != @subject
  end

  def same_letters?(candidate)
    letters_in_word(candidate) == letters_in_word(@subject)
  end

  def letters_in_word(word)
    word.chars.sort
  end
end

class Palindrome
  attr_reader :candidate
  def initialize(candidate)
    @candidate = normalize(candidate)
  end

  def is_palindrome?
    @candidate == @candidate.reverse
  end

  private

  def normalize(word)
    word.downcase.gsub(/\W/, '')
  end
end
