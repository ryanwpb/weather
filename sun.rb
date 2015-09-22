require 'httparty'
require 'byebug'
class Sun
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  def sunrise_hour
    @response["sun_phase"]["sunrise"]["hour"]
  end

  def sunrise_minute
    @response["sun_phase"]["sunrise"]["minute"]
  end

  def sunset_hour
    @response["sun_phase"]["sunset"]["hour"]
  end

  def sunset_minute
    @response["sun_phase"]["sunset"]["minute"]
  end

  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip}.json")
    file = File.read('sun_up_down.json')
    data_hash = JSON.parse(file)
  end
end

puts "Enter you're Zip Code!"
s = Sun.new(gets.chomp)
puts s.sunrise_hour
puts s.sunrise_minute
puts s.sunset_hour
puts s.sunset_minute
