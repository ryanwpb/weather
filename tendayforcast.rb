require 'json'

class TenDayForcast

    def initialize(zip)
      @zip = zip
      @response = get_response
    end

    def day_one
      @response["forecast"]["txt_forecast"]["forecastday"][0]["title"]
      @response["forecast"]["txt_forecast"]["forecastday"][0]["fcttext"]
    end

    


    private def get_response
      # key = ENV['WUNDERGROUND_KEY']
      # HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{@zip}.json")
      file = File.read('ten_day_forcast.json')
      data_hash = JSON.parse(file)
    end
end

puts "Enter you're Zip Code!"
t = TenDayForcast.new(gets.chomp)
puts t.day_one
