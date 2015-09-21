require 'httparty'
require 'byebug'


class Location
  attr_reader :zip

  def initialize(zip)
    @zip = zip
    # @response = get_response
  end

end
