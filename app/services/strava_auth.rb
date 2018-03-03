require 'rest-client'
require "json"

class StravaAuth

  attr_reader :code, :access_token

  def initialize(code)
    @client_id = ENV["STRAVA_ID"]
    @client_secret = ENV["STRAVA_SECRET"]
    @code = code
    @access_token = call
  end

  def call
    response = RestClient.post "https://www.strava.com/oauth/token", { client_id: @client_id, client_secret: @client_secret, code: @code}.to_json, {content_type: :json, accept: :json}
    parsed_response = JSON.parse(response.body)
    return parsed_response["access_token"]
  end


end
