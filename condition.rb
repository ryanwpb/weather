require 'json'
require 'byebug'




class Condition


  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  def current_temp
    @response["current_observation"]["temp_f"]
  end

  def current_humidity
    @response["current_observation"]["relative_humidity"]
  end

  def current_visibility
    @response["current_observation"]["visibility_mi"]
  end

  def current_wind_gust
    @response["current_observation"]["wind_gust_mph"]
  end

  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip}.json")
    file = File.read('west_palm_conditions.json')
    data_hash = JSON.parse(file)
  end
end

puts "Enter you're Zip Code!"
c = Condition.new(gets.chomp)
puts c.current_temp
puts c.current_humidity
puts c.current_visibility
puts c.current_wind_gust
