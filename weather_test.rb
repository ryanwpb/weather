require 'minitest/autorun'
require 'minitest/pride'
require './location'
require 'httparty'


class WeatherReportTest < Minitest::Test

  def test_new_location
    location = Location.new(33401)
    assert location.zip != 33404
    assert location.zip == 33401
  end
end
