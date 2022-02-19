# frozen_string_literal: true

class ParkService
  def self.search_parks(state)
    response = conn.get('parks', { stateCode: state })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    url = 'https://developer.nps.gov/api/v1/'
    Faraday.new(url: url, params: { api_key: ENV['nat_park_api_key'] })
  end
end