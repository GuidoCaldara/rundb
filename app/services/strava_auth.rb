require 'rest-client'
require "json"
class StravaAuth

  def initialize(code)
    @client_id = ENV["STRAVA_ID"]
    @client_secret = ENV["STRAVA_SECRET"]
    @code = code
    call
  end

  def call
    response = RestClient.post "https://www.strava.com/oauth/token", { client_id: @client_id, client_secret: @client_secret, code: @code}.to_json, {content_type: :json, accept: :json}
    raise
    parsed_response = JSON.parse(response.body)
    grab_user_data(parsed_response["access_token"])

  end

  def grab_user_data(access_token)

  end

end
