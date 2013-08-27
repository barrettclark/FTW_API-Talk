class ExampleController < ApplicationController
  def random_number
    @random_number = RandomNumber.random_number
  end

  def palindrome
    # NOTE: you would setup a form to take this as input or something
    @palindrome = Palindrome.new('civic')
    @palindrome.palindrome(false)
  end

  def anagram
  end
end
