require 'minitest/autorun'
require 'minitest/pride'
require './location'
require './condition'
require './ten_day_forcast'
require 'httparty'


class WeatherReportTest < Minitest::Test

  def test_new_location
    location = Location.new(33401)
    assert location.zip != 33404
    assert location.zip == 33401
  end

  def test_new_temp
    condition = Condition.new(33401)
    assert_equal 87.4, condition.current_temp
    refute_equal 87.5, condition.current_temp
  end

  def test_new_humidity
    condition = Condition.new(33401)
    assert_equal "71%", condition.current_humidity
    refute_equal "81%", condition.current_humidity
  end

  def test_new_visibility
    condition = Condition.new(33401)
    assert_equal "10.0", condition.current_visibility
    refute_equal "9.0", condition.current_visibility
  end

  def test_new_wind_gust
    condition = Condition.new(33401)
    assert_equal "9.0", condition.current_wind_gust
    refute_equal "10.0", condition.current_wind_gust
  end

  def test_new_sunrise
    sun = Sun.new(33401)
    assert_equal "sunrise", sun.sunrise_hour
    refute_equal "sundown", sun.sunrise_hour
  end

  def test_new_sundown
    sun = Sun.new(33401)
    assert_equal "sundown", sun.sunset_hour
    refute_equal "sunrise", sun.sunrise_hour
  end
end
