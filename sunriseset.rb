require 'json'

class SunRiseSet

  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  def sunrise
    @response["sun_phase"]["sunrise"]["hour"] << ["sun_phase"]["sunrise"]["minute"]
  end

  def sunset
    @response["sun_phase"]["sunset"]["hour"] << ["sun_phase"]["sunset"]["minute"]
  end

  private def get_response
    # key = ENV['WUNDERGROUND_KEY']
    # HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip}.json")
    file = File.read('sun_up_down.json')
    data_hash = JSON.parse(file)
  end
end

  puts "Enter you're Zip Code!"
  s = SunRiseSet.new(gets.chomp)
  puts s.sunrise
  puts s.sunset
