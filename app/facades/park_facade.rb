class ParkFacade
  def self.state_parks(state)
    json = ParkService.search_parks(state)
    json[:data].map do |park_data|
      Park.new(park_data)
    end
  end
end
