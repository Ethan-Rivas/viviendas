require 'rest-client'

class Ivey
  API_URL = 'http://localhost:3000/api/v1/'

  def initialize(email, password, api_url = nil, headers = {})
    @email    = email
    @password = password
    @api_url  = api_url || API_URL
    @headers  = headers
    @response = nil
  end
  attr_accessor :email, :password, :api_url, :headers, :response

  def self.signup(email, password, api_url = API_URL)
    client = nil
    RestClient.post("#{api_url}auth", {
      email: email,
      password: password,
      password_confirmation: password
    }, { accept: 'application/json' }) do |response|
      ap JSON.parse(response.body)

      headers = response.headers
      client = Ivey.new(email, password, api_url, {
        'access-token' => headers[:access_token],
        'client'       => headers[:client],
        'token-type'   => 'Bearer',
        'uid'          => email
      })
    end

    return client
  end

  def get(path)
    RestClient.get("#{@api_url}#{path}", @headers.merge({
      accept: 'application.json'
    })) do |response|

      self.response = JSON.parse(response.body)
      self.headers['access-token'] = response.headers[:access_token]
    end

    ap @response
    return self
  end

  def put(path, params = {})
    RestClient.put("#{@api_url}#{path}", params, @headers.merge({
      accept: 'application.json'
    })) do |response|

      self.response = JSON.parse(response.body)
      self.headers['access-token'] = response.headers[:access_token]
    end

    ap @response
    return self
  end
end
