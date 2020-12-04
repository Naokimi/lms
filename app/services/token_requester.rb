require 'uri'
require 'net/http'

class TokenRequester
  def call
    url = URI("https://#{ENV['AUTH0_DOMAIN']}/oauth/token")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request['content-type'] = 'application/json'
    request.body = "{\"client_id\":\"#{ENV['AUTH0_CLIENT_ID']}\",\"client_secret\":\"#{ENV['AUTH0_CLIENT_SECRET']}\",\"audience\":\"https://#{ENV['AUTH0_DOMAIN']}/api/v2/\",\"grant_type\":\"client_credentials\"}"

    response = http.request(request)
    response.read_body
  end
end
